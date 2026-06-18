#!/bin/bash

services=(
analytics-service
api-gateway
auth-service
customer-service
discovery-server
integration-service
marketing-service
notification-service
sales-service
support-service
workflow-service
)

for service in "${services[@]}"
do
cat > kubernetes/$service/hpa.yaml <<EOF
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler

metadata:
  name: ${service}-hpa
  namespace: kd

spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: ${service}

  minReplicas: 1
  maxReplicas: 2

  metrics:
  - type: Resource
    resource:
      name: cpu

      target:
        type: Utilization
        averageUtilization: 70
EOF

echo "Created HPA for $service"
done

echo "All HPA files created successfully."

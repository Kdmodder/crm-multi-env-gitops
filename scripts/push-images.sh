#!/bin/bash

VERSION="1.0.0"
DOCKER_USER="kdmodder"

services=(
  analytics-service
  api-gateway
  auth-service
  crm-frontend
  customer-service
  integration-service
  marketing-service
  notification-service
  sales-service
  support-service
  workflow-service
)

for service in "${services[@]}"
do
  echo "=================================="
  echo "Pushing ${DOCKER_USER}/${service}:${VERSION}"
  echo "=================================="

  docker push ${DOCKER_USER}/${service}:${VERSION}

  echo ""
done

echo "All images pushed successfully!"

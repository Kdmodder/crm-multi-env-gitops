FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

COPY . .

RUN mvn clean package -pl workflow-service -am -DskipTests

FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=builder /app/workflow-service/target/*.jar app.jar

EXPOSE 8087

ENTRYPOINT ["java","-jar","app.jar"]

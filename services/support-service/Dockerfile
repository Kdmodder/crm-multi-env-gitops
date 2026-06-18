FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

COPY . .

RUN mvn clean package -pl support-service -am -DskipTests

FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=builder /app/support-service/target/*.jar app.jar

EXPOSE 8085

ENTRYPOINT ["java","-jar","app.jar"]

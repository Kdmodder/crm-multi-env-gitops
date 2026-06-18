# =========================
# Stage 1 - Build
# =========================
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy complete CRM project
COPY . .

# Build integration-service module
RUN mvn clean package -pl integration-service -am -DskipTests

# =========================
# Stage 2 - Runtime
# =========================
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy built jar
COPY --from=builder /app/integration-service/target/*.jar app.jar

EXPOSE 8088

ENTRYPOINT ["java","-jar","app.jar"]

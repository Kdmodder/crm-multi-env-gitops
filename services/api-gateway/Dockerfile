# =========================
# Stage 1 - Build
# =========================
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy complete project
COPY . .

# Build only api-gateway module
RUN mvn clean package -pl api-gateway -am -DskipTests

# =========================
# Stage 2 - Runtime
# =========================
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy built jar
COPY --from=builder /app/api-gateway/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]

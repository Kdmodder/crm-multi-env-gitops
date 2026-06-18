# =========================
# Stage 1: Build
# =========================
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy entire project
COPY . .

# Build only discovery-server module
RUN mvn clean package -pl discovery-server -am -DskipTests

# =========================
# Stage 2: Runtime
# =========================
FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=builder /app/discovery-server/target/*.jar app.jar

EXPOSE 8761

ENTRYPOINT ["java","-jar","app.jar"]

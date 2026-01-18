# 1. Gunakan Java runtime
FROM eclipse-temurin:17-jdk-alpine

# 2. Set working directory di container
WORKDIR /app

# 3. Copy file Maven Wrapper & pom.xml
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# 4. Download dependency dulu (cache)
RUN ./mvnw dependency:go-offline

# 5. Copy source code
COPY src src

# 6. Build aplikasi
RUN ./mvnw package -DskipTests

# 7. Jalankan aplikasi
ENTRYPOINT ["java","-jar","target/user-management-backend-0.0.1-SNAPSHOT.jar"]

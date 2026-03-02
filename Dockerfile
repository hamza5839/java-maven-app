# Use a valid OpenJDK runtime image
FROM eclipse-temurin:11-jre

# Set working directory inside container
WORKDIR /app

# Copy the built jar from Maven target folder
COPY target/java-maven-app-1.1.0-SNAPSHOT.jar app.jar

# Expose Spring Boot default port
EXPOSE 8080

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]

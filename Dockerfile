# Use a Java runtime
FROM openjdk:11-jre-slim

# Set working directory inside container
WORKDIR /app

# Copy the built jar from Maven target folder
COPY target/java-maven-app-1.1.0-SNAPSHOT.jar app.jar

# Expose the port your Spring Boot app runs on
EXPOSE 8080

# Run the jar
ENTRYPOINT ["java","-jar","app.jar"]

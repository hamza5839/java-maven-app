FROM node

WORKDIR /app

# Copy the Maven-built JAR
COPY target/java-maven-app-1.1.0-SNAPSHOT.jar app.jar

# Run the app
CMD ["java", "-jar", "app.jar"]

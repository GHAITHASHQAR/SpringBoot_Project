# Use an official OpenJDK runtime as the base image
FROM openjdk:17-jdk

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file and dependencies into the container at /app
COPY build/libs/*.jar /app/demo.jar

# Expose the port that your Spring Boot application listens on
EXPOSE 8080

# Define the command to run your application
CMD ["java", "-jar", "demo.jar"]

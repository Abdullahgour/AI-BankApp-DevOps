# Get a base image for java
FROM eclipse-temurin:21-jdk-jammy

# Code in a working directory
WORKDIR /app

# Copy all the code files
COPY . .

# Install the libraries with maven
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

# Indicate the port number to be exposed
EXPOSE 8080

ENTRYPOINT ["sh","-c", "java -jar target/*.jar"]

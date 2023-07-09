FROM maven:3.6.3-jdk-8 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:8-jre-slim
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
ENTRYPOINT["java","-jar","demo.jar"]
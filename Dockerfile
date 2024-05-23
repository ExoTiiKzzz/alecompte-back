FROM openjdk:17-jdk-slim

WORKDIR /app

COPY mvnw /app/mvnw
COPY .mvn /app/.mvn
COPY pom.xml /app/

RUN ./mvnw clean install

RUN ls target

COPY target/spring-boot-jpa-h2-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8080

CMD ["java", "-jar", "/app/app.jar"]
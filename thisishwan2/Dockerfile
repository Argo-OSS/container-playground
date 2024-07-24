FROM gradle:8.8-jdk17 AS builder

WORKDIR /app

COPY my_web_service/build.gradle my_web_service/settings.gradle /app/

COPY /my_web_service/src /app/src

RUN gradle build --no-daemon

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=builder /app/build/libs/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
FROM openjdk:17

WORKDIR /app

EXPOSE 8080

ARG JAR_FILE=my_web_service/build/libs/*.jar

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
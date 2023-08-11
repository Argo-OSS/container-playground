FROM azul/zulu-openjdk-alpine:17-latest

LABEL AUTHOR="qudtjs0753 <qudtjs3636@gmail.com>"

# 컨테이너 상에서의 작업 디렉토리로 전환
WORKDIR /docker_api_test

COPY ./docker_api_test .

RUN ./gradlew build

CMD ["java", "-jar", "/docker_api_test/build/libs/docker_api_test-0.0.1-SNAPSHOT.jar"]
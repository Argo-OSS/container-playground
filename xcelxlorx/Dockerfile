# build stage
FROM python:3.11 AS build

# 작업 디렉토리
WORKDIR /app

# pip install
COPY requirements.txt .
RUN pip install -r requirements.txt

# 소스 코드 복사
COPY . .

# final stage
FROM python:3.11-slim

# 작업 디렉토리
WORKDIR /app

# build stage에서 필요한 파일 복사
COPY --from=build /app /app
COPY --from=build /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=build /usr/local/bin /usr/local/bin

# 포트 노출
EXPOSE 8080

# 컨테이너 시작 시 실행될 명령어
CMD ["python", "app.py"]
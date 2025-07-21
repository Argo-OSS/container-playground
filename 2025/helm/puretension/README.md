# Puretension Web Service

Container Playground 과제를 위한 웹서비스입니다.

## 기능

- 기본 API 엔드포인트: `/`
- GitHub 계정 API: `/api/v1/puretension`
- 헬스체크 API: `/healthcheck`

## 로컬 실행

```bash
# 의존성 설치
npm install

# 개발 서버 실행
npm start
```

서버는 기본적으로 8080 포트에서 실행됩니다. 환경변수 `PORT`를 설정하여 포트를 변경할 수 있습니다.

## Docker 빌드 및 실행

```bash
# 이미지 빌드
docker build -t puretension-service .

# 컨테이너 실행
docker run -d -p 30080:8080 puretension-service
```

## Kubernetes 배포

Helm Chart를 사용하여 Kubernetes에 배포할 수 있습니다.

```bash
# Helm Chart 설치
helm install puretension-service ./charts

# 서비스 확인
kubectl get svc
```

서비스는 NodePort 타입으로 30080 포트에서 노출됩니다.

## API 엔드포인트

### GET /

기본 웰컴 메시지를 반환합니다.

### GET /api/v1/puretension

GitHub 계정 정보를 반환합니다.

### GET /healthcheck

서비스 상태를 확인합니다.

## 기술 스택

- Node.js 18
- Express.js
- Docker
- Kubernetes
- Helm

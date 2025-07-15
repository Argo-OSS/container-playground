#!/bin/bash

IMAGE_NAME="sinnoln/my-webservice:1.0.0"
HELM_RELEASE_NAME="sinnoln-app"
APP_LABEL_KEY="app.kubernetes.io/name"
APP_LABEL_VALUE="sinnoln-go-service"
GITHUB_USER="SinnoLn"
LOCAL_PORT=8080
POD_PORT=8080
PF_PID=""

set -e

cleanup() {
  echo ""
  echo "--- 🧹 테스트 환경 정리 시작 ---"

  if [ ! -z "$PF_PID" ] && ps -p $PF_PID > /dev/null; then
    echo "Port-forward 프로세스(PID: $PF_PID)를 종료합니다."
    kill $PF_PID
  fi

  if helm status $HELM_RELEASE_NAME &> /dev/null; then
    helm uninstall $HELM_RELEASE_NAME
    echo "Helm 배포 $HELM_RELEASE_NAME 삭제 완료."
  else
    echo "ℹHelm 배포 $HELM_RELEASE_NAME 가 존재하지 않아 정리를 건너뜁니다."
  fi
  echo "--- 🧹 정리 완료 ---"
}

trap cleanup EXIT

echo "--- 자동 테스트 시작 ---"

echo ""
echo "[1/4] Minikube Docker 환경 설정 및 이미지 빌드"
eval $(minikube -p minikube docker-env)
docker build -t $IMAGE_NAME .
echo "이미지 빌드 완료: $IMAGE_NAME"

echo ""
echo "[2/4] Helm Chart 배포"
helm install $HELM_RELEASE_NAME ./charts --wait
echo "Helm 배포 완료. Pod가 준비되었습니다."

echo ""
echo "[3/4] API 테스트 실행"
echo "Pod를 찾는 중..."
POD_NAME=$(kubectl get pods -l $APP_LABEL_KEY=$APP_LABEL_VALUE -o jsonpath='{.items[0].metadata.name}')

if [ -z "$POD_NAME" ]; then
    echo "에러: 테스트할 Pod를 찾을 수 없습니다. 라벨($APP_LABEL_KEY=$APP_LABEL_VALUE)을 확인하세요."
    exit 1
fi
echo "테스트 대상 Pod: $POD_NAME"

echo "Port-forward 터널을 백그라운드에서 생성합니다 (localhost:$LOCAL_PORT -> Pod:$POD_PORT)"
kubectl port-forward pod/$POD_NAME $LOCAL_PORT:$POD_PORT &
PF_PID=$!

echo "터널이 안정화될 때까지 5초 대기합니다..."
sleep 5

SERVICE_URL="http://localhost:$LOCAL_PORT"
echo "테스트 대상 URL: $SERVICE_URL"
echo ""

echo "  - 테스트 1/2: /healthcheck"
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" $SERVICE_URL/healthcheck)
if [ "$STATUS_CODE" -eq 200 ]; then
    echo "  통과 - HTTP Status: $STATUS_CODE"
else
    echo "  실패 - HTTP Status: $STATUS_CODE, 예상: 200"
    exit 1
fi

echo "  - 테스트 2/2: /api/v1/$GITHUB_USER"
RESPONSE=$(curl -s $SERVICE_URL/api/v1/$GITHUB_USER)
EXPECTED_RESPONSE="Hello from /api/v1/$GITHUB_USER!"
if [ "$RESPONSE" == "$EXPECTED_RESPONSE" ]; then
    echo "  통과 - 응답 메시지 일치"
else
    echo "  실패 - 응답 메시지 불일치"
    echo "      - 받은 응답: $RESPONSE"
    echo "      - 예상 응답: $EXPECTED_RESPONSE"
    exit 1
fi

echo ""
echo "--- 🎉 모든 테스트를 성공적으로 통과했습니다! ---"
echo ""
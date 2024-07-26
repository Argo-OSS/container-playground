#!/bin/bash

# daengdaengLee 폴더에서 실행

CLUSTER_NAME=argoproj-ossca
IMAGE_NAME=ossca:test

# 기존 이미지 삭제
docker image rm $IMAGE_NAME

# 이미지 빌드
docker build -t $IMAGE_NAME .

# 기존 클러스터 삭제
kind delete cluster -n $CLUSTER_NAME

# 기존 kind 설정 삭제
rm -f ./config.yaml

# kind 설정 생성
echo "kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: $CLUSTER_NAME
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30080
    hostPort: 30080
- role: worker" >> config.yaml

# 테스트 클러스터 생성
kind create cluster --config ./config.yaml

# kind 설정 삭제
rm -f ./config.yaml

# 도커 이미지 테스트 클러스터에 로드
kind load docker-image $IMAGE_NAME --name $CLUSTER_NAME

# helm 차트 설치
helm install --wait --set image.name=$IMAGE_NAME ossca-test ./charts

# 배포 확인
docker ps
kubectl get pod --show-labels -o wide
kubectl get svc -o wide
curl -v localhost:30080/healthcheck

# 테스트 클러스터 삭제
kind delete cluster -n $CLUSTER_NAME

# 도커 이미지 삭제
docker image rm ossca:test

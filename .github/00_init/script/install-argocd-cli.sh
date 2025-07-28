#!/bin/sh
set -e

# 최선 버전 가져오기
ARGOCD_VERSION=$(curl -s https://api.github.com/repos/argoproj/argo-cd/releases/latest | jq -r .tag_name)

# OS 및 아키텍처 확인
OS=$(uname | tr '[:upper:]' '[:lower:]')
echo "✅ OS $OS"
ARCH=$(uname -m)

case "$ARCH" in
x86_64) ARCH=amd64 ;;
aarch64 | arm64) ARCH=arm64 ;;
*) echo "❌ Unsupported arch: $ARCH"; exit 1 ;;
esac
echo "✅ ARCH $ARCH"

# 다운로드 URL
URL="https://github.com/argoproj/argo-cd/releases/download/${ARGOCD_VERSION}/argocd-${OS}-${ARCH}"
curl -sSL -o argocd "$URL"

# 설치
chmod +x argocd
sudo mv argocd /usr/local/bin/


echo "✅ Argo CD CLI installed: $(argocd version --client --short)"
# reference: https://thearchivelog.dev/article/optimize-docker-image/

# 1. Build stage (의존성만 설치)
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY app.js ./

# 2. Production stage (최소 파일만 복사)
FROM node:18-alpine AS production

WORKDIR /app

COPY --from=builder /app/package*.json ./
RUN npm ci --omit=dev --ignore-scripts && npm cache clean --force

COPY --from=builder /app/app.js ./

EXPOSE 8080

CMD ["node", "app.js"]
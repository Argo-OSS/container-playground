# stage 1. build the application
FROM node:18-alpine AS builder

WORKDIR /app

# package.json과 package-lock.json을 먼저 복사하여 의존성 설치
COPY package*.json ./

# package-lock.json 기반 의존성 설치, node_modules 폴더 삭제 후 재설치
RUN npm ci
COPY . .

# typescript 파일 빌드 -> dist 폴더에 저장
RUN npm run build

# stage 2. create the production image
FROM node:18-alpine AS production

WORKDIR /app

COPY --from=builder /app/package*.json ./

RUN npm ci --only=production && npm cache clean --force

COPY --from=builder /app/dist ./dist

EXPOSE 8080

CMD ["node", "dist/app.js"]
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

# package-lock.json 기반 의존성 설치, node_modules 폴더 삭제 후 재설치
RUN npm ci
COPY . .

EXPOSE 8080

CMD ["npm", "run", "start:prod"]
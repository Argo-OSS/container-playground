FROM node:22.5.1-alpine

WORKDIR /app

RUN npm install -g pnpm

COPY package.json pnpm-lock.yaml ./

COPY . .

RUN pnpm install --frozen-lockfile && pnpm run build 

EXPOSE 8080

CMD ["pnpm", "start"]
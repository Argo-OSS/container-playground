FROM node:18-alpine AS build

WORKDIR /app
COPY ./app/package*.json ./app/tsconfig.json ./
COPY ./app/ .

RUN npm install
RUN npm run build

FROM node:18-alpine AS production

WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/package*.json ./

RUN npm ci --only=production && npm cache clean --force

ENV PORT=8080
EXPOSE 8080
CMD ["node", "dist/main.js"]
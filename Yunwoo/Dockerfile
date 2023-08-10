FROM node:latest AS build

WORKDIR /app

COPY package.json tsconfig.json ./
COPY src ./src

RUN yarn install --production

COPY . .

RUN yarn run build

EXPOSE 8080
CMD [ "node", "dist/main.js" ]
FROM node:18 AS build

RUN mkdir -p /app

WORKDIR /app

COPY . .

RUN yarn install --production

RUN yarn run build

EXPOSE 8080

CMD [ "node", "dist/main.js" ]
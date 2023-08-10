FROM node:18 AS build

WORKDIR /app

RUN yarn install --production

COPY . .

RUN yarn run build

EXPOSE 8080

CMD [ "node", "dist/main.js" ]
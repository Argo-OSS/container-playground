FROM node:18-alpine

WORKDIR /app

COPY package.json yarn.lock /app/

RUN yarn install

COPY . /app

RUN yarn run build

EXPOSE 8080

CMD [ "node", "dist/main.js" ]
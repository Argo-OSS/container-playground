FROM node:16-alpine3.14

WORKDIR /container

COPY ./container/package.json ./container/yarn.lock ./

RUN yarn install

COPY ./container/ ./

RUN yarn build

ENTRYPOINT ["node", "/container/dist/main.js"]

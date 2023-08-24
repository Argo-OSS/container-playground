FROM node:16-alpine3.14

WORKDIR /

COPY ./container/package.json ./container/yarn.lock /container/

RUN cd /container && yarn install

COPY . .

RUN cd /container && yarn build

ENTRYPOINT ["node", "/container/dist/main.js"]

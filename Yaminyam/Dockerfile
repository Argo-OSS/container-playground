FROM node:16-alpine3.14

WORKDIR /

COPY . .

RUN cd container && yarn install
RUN cd container && yarn build

ENTRYPOINT ["node", "/container/dist/main.js"]

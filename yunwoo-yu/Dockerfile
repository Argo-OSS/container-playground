FROM node:18

WORKDIR /app

COPY packge*.json /app

RUN yarn install --production

COPY . /app

RUN yarn run build

EXPOSE 8080

CMD [ "node", "dist/main.js" ]
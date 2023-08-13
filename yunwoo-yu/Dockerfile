FROM node:18

WORKDIR /app

COPY . .

RUN yarn install

RUN yarn run build

EXPOSE 8080

CMD [ "node", "dist/main.js" ]
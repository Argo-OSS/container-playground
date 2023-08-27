FROM node:18-alpine

WORKDIR /app

COPY package.json yarn.lock tsconfig.json ./

RUN yarn install

COPY . .

RUN yarn run build

EXPOSE 8080

CMD [ "node", "dist/main.js" ]
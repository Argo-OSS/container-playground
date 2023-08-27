# dev nest cli를 위해 전체 install 후 권한 주기
FROM node:18-alpine


WORKDIR /app

COPY package.json yarn.lock tsconfig.json ./

RUN yarn install

COPY . .

RUN yarn run build

EXPOSE 8080

CMD [ "node", "dist/main.js" ]
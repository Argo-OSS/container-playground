FROM node:18-alpine

WORKDIR /app

COPY package.json yarn.lock tsconfig.json ./

RUN yarn install --production

COPY node_modules /app/node_modules

RUN yarn run build

EXPOSE 8080

CMD [ "node", "dist/main.js" ]
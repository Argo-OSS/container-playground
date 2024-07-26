FROM node:18-alpine

WORKDIR /usr/src/app

COPY package.json tsconfig.json package-lock.json ./

COPY . .

RUN npm install
RUN npm run build

EXPOSE 8080

CMD ["npm", "start"] 
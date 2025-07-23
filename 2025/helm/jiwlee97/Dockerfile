FROM node:18

WORKDIR /app
COPY ./app/ .

RUN npm install
RUN npx tsc

ENV PORT=8080
EXPOSE 8080

CMD ["node", "dist/main.js"]
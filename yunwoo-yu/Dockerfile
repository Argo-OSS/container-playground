# dev nest cli를 위해 전체 install 후 권한 주기
FROM node:18-alpine AS nodes

FROM nodes AS nodebase

WORKDIR /app

COPY --chown=node:node package.json yarn.lock tsconfig.json /app/

RUN yarn install

USER node

FROM nodes AS prodbuild

WORKDIR /app

# nodeBase 덮어씌우기 (nest cli 사용가능)
COPY --chown=node:node --from=nodebase /app/node_modules /app/node_modules
COPY --chown=node:node . .

# 빌드를 먼저 진행하고
RUN yarn build

# 모듈을 production 패키지로 변경

RUN yarn --production

USER node

FROM nodes AS prodstart

WORKDIR /app

COPY --chown=node:node --from=prodbuild /app/node_modules /app/node_modules
COPY --chown=node:node --from=prodbuild /app/dist /app/dist

EXPOSE 8080

CMD [ "node", "dist/main.js" ]
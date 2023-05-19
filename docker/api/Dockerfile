ARG NODE_VER
ARG node_image=node:$NODE_VER-slim
FROM $node_image as deps

COPY --chown=node:node /package*.json /app/

USER node
WORKDIR /app

RUN npm i --no-audit

FROM $node_image

COPY --chown=node:node --from=deps /app/node_modules /app/node_modules
COPY --chown=node:node . /app/

USER node
WORKDIR /app

RUN npm run build

ENTRYPOINT [ "node" ]
CMD [ "src/server/www" ]

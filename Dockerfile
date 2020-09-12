FROM node:12.16-alpine

WORKDIR /app/wss-web-app-foo
ENV PORT=3000
EXPOSE 3000

RUN apk add jq --no-cache && apk update && apk add py-pip --no-cache && pip install awscli

COPY . /app/wss-web-app-foo
COPY docker-entrypoint.sh /app/

RUN chown -R node:node /app/wss-web-app-foo/
USER node

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["node", "-r", "source-map-support/register", "build/index.js"]

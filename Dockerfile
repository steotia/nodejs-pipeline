FROM node:8.1.0-alpine
ENV LAST_UPDATED 0
ENV CONTAINER_PORT 0

RUN addgroup -S app && adduser -S -g app -s /bin/false app

ENV HOME=/home/app

ADD dist/bundle.tar.gz $HOME/helloworld/
# RUN chown -R app:app $HOME/helloworld/*

USER app
WORKDIR $HOME/helloworld

EXPOSE ${CONTAINER_PORT}

CMD ["sh", "-c", "PORT=${CONTAINER_PORT} node app.js"]
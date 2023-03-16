FROM alpine:3.17.2

RUN apk add rsync

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY logs.sh /usr/local/bin/logs.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]

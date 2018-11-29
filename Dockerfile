FROM alpine:3.8

RUN apk update && apk add \
    hugo

WORKDIR /app

ENTRYPOINT [ "hugo" ]

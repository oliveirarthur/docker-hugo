FROM alpine:3.8

RUN apk update \
    && apk add -y \
        libc6-compat libstdc++ libgcc \
        curl \
        jq \
        wget

RUN wget $(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | \
        jq -r '.assets[] | .browser_download_url' | \
        grep Linux-64bit | \
        grep extended | \
        grep tar.gz) -O /tmp/hugo.tar.gz \
    && mkdir /tmp/hugo \
    && tar -xvf /tmp/hugo.tar.gz -C /tmp/hugo \
    && mv /tmp/hugo/hugo /usr/local/bin/hugo \
    && rm -rf /tmp/hugo.tar.gz /tmp/hugo

RUN apk del -y \
    curl \
    jq \
    wget

WORKDIR /app

ENTRYPOINT [ "hugo" ]

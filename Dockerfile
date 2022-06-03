FROM alpine:latest

LABEL description="Docker container for building static sites with the Hugo static site generator."
LABEL maintainer="Zhao Wang <zhaow.km@gmail.com>"

ENV HUGO_VERSION=0.100.1

RUN wget -O - https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz | tar -xz -C /tmp \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -rf /tmp/${HUGO_ID}_linux_amd64 \
    && rm -rf /tmp/LICENSE.md \
    && rm -rf /tmp/README.md

RUN apk add --update git asciidoctor libc6-compat libstdc++ \
    && apk upgrade \
    && apk add --no-cache ca-certificates

VOLUME /src

WORKDIR /src

ENTRYPOINT ["/usr/local/sbin/hugo"]

EXPOSE 1313

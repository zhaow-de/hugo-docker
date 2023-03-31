FROM alpine:latest

LABEL description="Docker container for building static sites with the Hugo static site generator."
LABEL maintainer="Zhao Wang <zhaow.km@gmail.com>"

ENV HUGO_VERSION=0.111.3

COPY get_platform.sh .

RUN set -ex \
    && PLATFORM=$(./get_platform.sh) \
    && wget -O - https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-${PLATFORM}.tar.gz | tar -xz -C /tmp \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -rf /tmp/* \
    && apk upgrade \
    && apk add --no-cache --update asciidoctor ca-certificates git libc6-compat libstdc++

VOLUME /src

WORKDIR /src

ENTRYPOINT ["/usr/local/sbin/hugo"]

EXPOSE 1313

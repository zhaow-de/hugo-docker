FROM debian:latest

LABEL description="Docker container for building static sites with the Hugo static site generator."
LABEL maintainer="Zhao Wang <zhaow.km@gmail.com>"

ENV HUGO_VERSION=0.111.3

COPY get_platform.sh .

RUN set -ex \
    && PLATFORM=$(./get_platform.sh) \
    && apt-get -qq update \
    && apt -qq install -y --no-install-recommends curl ca-certificates asciidoctor git \
    && curl -sSLo /tmp/hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-${PLATFORM}.deb \
    && dpkg -i /tmp/hugo.deb \
    && rm -f /tmp/hugo.deb

VOLUME /src

WORKDIR /src

ENTRYPOINT ["/usr/local/bin/hugo"]

EXPOSE 1313

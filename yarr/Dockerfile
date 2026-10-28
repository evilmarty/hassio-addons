FROM ghcr.io/nkanaev/yarr:v2.9
ARG BASHIO_VERSION="0.14.3"
RUN apk add --no-cache bash jq curl \
    && mkdir -p /usr/src/bashio \
    && wget -q -O- "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz" \
         | tar -xzf - --strip 1 -C /usr/src/bashio \
    && mv /usr/src/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && rm -rf /usr/src/*
COPY rootfs /
VOLUME /data
ENTRYPOINT ["/init"]
CMD ["/usr/local/bin/yarr"]

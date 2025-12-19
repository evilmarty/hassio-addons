FROM ghcr.io/livebook-dev/livebook:0.18.2
ARG BASHIO_VERSION="0.14.3"
RUN apt-get update \
    && apt-get install -y --no-install-recommends jq curl ca-certificates \
    && mkdir -p /usr/src/bashio \
    && wget -q -O- "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz" \
         | tar -xzf - --strip 1 -C /usr/src/bashio \
    && mv /usr/src/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/src/*
COPY rootfs /
VOLUME /data /share
ENTRYPOINT ["/init"]
CMD ["/app/bin/livebook", "start"]

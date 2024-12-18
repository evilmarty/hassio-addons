FROM ubuntu:noble
ARG BASHIO_VERSION="0.14.3"
ARG BEDROCK_SERVER_VERSION="1.21.51.01"
ARG BUILD_VERSION="${BEDROCK_SERVER_VERSION}"
ARG BUILD_ARCH="amd64"
ENV LD_LIBRARY_PATH /opt/minecraft
COPY rootfs /
WORKDIR /opt/minecraft/
RUN apt-get update \
  && apt-get install -y --no-install-recommends jq curl ca-certificates unzip \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /usr/src/*
RUN mkdir -p /usr/src/bashio \
  && curl -s -L "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz" \
  | tar -xzf - --strip 1 -C /usr/src/bashio \
  && mv /usr/src/bashio/lib /usr/lib/bashio \
  && ln -s /usr/lib/bashio/bashio /usr/bin/bashio
RUN curl -L \
  -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.2903.86" \
  -O "https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-${BEDROCK_SERVER_VERSION}.zip" \
  && unzip -q bedrock-server-${BEDROCK_SERVER_VERSION}.zip \
  && rm -f bedrock-server-${BEDROCK_SERVER_VERSION}.zip
CMD ["/opt/minecraft/run.sh"]
VOLUME /data
WORKDIR /data
LABEL \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.type="addon" \
  io.hass.arch="${BUILD_ARCH}"

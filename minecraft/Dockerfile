FROM eclipse-temurin:21-jre
ARG BUILD_VERSION="1.20.4"
ARG BUILD_ARCH="amd64"
ARG BASHIO_VERSION="0.14.3"
ARG SERVER_JAR_URL="https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar"
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
WORKDIR /opt/minecraft/
ADD $SERVER_JAR_URL .
CMD ["/opt/minecraft/run.sh", "/opt/minecraft/server.jar"]
VOLUME /data /share /ssl
LABEL \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.type="addon" \
  io.hass.arch="${BUILD_ARCH}"

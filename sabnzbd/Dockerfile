ARG SABNZBD_VERSION=latest
FROM ghcr.io/linuxserver/sabnzbd:${SABNZBD_VERSION}
ARG BASHIO_VERSION=0.14.3
ARG TEMPIO_VERSION=2021.09.0
RUN apk add jq nginx \
    && curl -f -J -L -o /tmp/bashio.tar.gz "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz" \
    && mkdir /tmp/bashio \
    && tar zxvf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && ARCH=$(uname -m); if [ "$ARCH" = "x86_64" ]; then ARCH="amd64"; fi \
    && curl -f -L -v -o /usr/bin/tempio "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${ARCH}" \
    && chmod a+x /usr/bin/tempio \
    && rm -rf /tmp/* /etc/nginx
COPY rootfs /
VOLUME /data /media /share /ssl

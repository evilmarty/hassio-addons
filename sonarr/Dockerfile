FROM ghcr.io/linuxserver/sonarr:latest
RUN apt-get -qq update \
    && apt-get -qq install --no-install-recommends -y nginx \
    && (apt-get autoremove -y; apt-get autoclean -y) \
    && curl -f -J -L -o /tmp/bashio.tar.gz "https://github.com/hassio-addons/bashio/archive/v0.14.3.tar.gz" \
    && mkdir /tmp/bashio \
    && tar zxvf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && ARCH=$(uname -m); if [ "$ARCH" = "x86_64" ]; then ARCH="amd64"; fi \
    && curl -f -L -s -o /usr/bin/tempio "https://github.com/home-assistant/tempio/releases/download/2021.09.0/tempio_${ARCH}" \
    && chmod a+x /usr/bin/tempio \
    && rm -rf /tmp/* /var/tmp/* /etc/nginx
COPY rootfs /
VOLUME /data /media /share /ssl

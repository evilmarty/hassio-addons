FROM ghcr.io/linuxserver/sabnzbd:latest
RUN apk add jq nginx \
    && curl -J -L -o /tmp/bashio.tar.gz "https://github.com/hassio-addons/bashio/archive/v0.14.3.tar.gz" \
    && mkdir /tmp/bashio \
    && tar zxvf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && curl -L -s -o /usr/bin/tempio "https://github.com/home-assistant/tempio/releases/download/2021.09.0/tempio_$(uname -m)" \
    && chmod a+x /usr/bin/tempio \
    && rm -rf /tmp/* /etc/nginx
COPY rootfs /

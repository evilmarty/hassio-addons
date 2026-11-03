FROM ghcr.io/henmedia/layerling:1.136.0
ARG BASHIO_VERSION="0.14.3"
USER root
ENV NEXT_TELEMETRY_DISABLED=1 \
    LAYERLING_SHARED_PROJECTS_DIR=/data/projects \
    LAYERLING_DEFAULT_THEME=system \
    LAYERLING_SIMPLE_MODE=false \
    LAYERLING_NEW_DESIGNS_ON_SERVER=always
RUN apt-get update \
    && apt-get install -y --no-install-recommends bash jq curl ca-certificates \
    && mkdir -p /usr/src/bashio \
    && curl -fsSL "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz" \
         | tar -xzf - --strip 1 -C /usr/src/bashio \
    && mv /usr/src/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && rm -rf /usr/src/bashio \
    && rm -rf /var/lib/apt/lists/* \
    && rmdir /app/.codex/project-thumbnails \
    && ln -s /data/project-thumbnails /app/.codex/project-thumbnails
COPY --chmod=755 rootfs/init /init
VOLUME /data
ENTRYPOINT ["/init"]
CMD ["node", "node_modules/next/dist/bin/next", "start", "apps/web"]

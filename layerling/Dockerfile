FROM ghcr.io/henmedia/layerling:1.136.0
USER root
ENV NEXT_TELEMETRY_DISABLED=1 \
    LAYERLING_SHARED_PROJECTS_DIR=/data/projects
RUN rmdir /app/.codex/project-thumbnails \
    && ln -s /data/project-thumbnails /app/.codex/project-thumbnails
COPY --chmod=755 rootfs/init /init
VOLUME /data
ENTRYPOINT ["/init"]
CMD ["node", "node_modules/next/dist/bin/next", "start", "apps/web"]

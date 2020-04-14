ARG BUILD_FROM
FROM $BUILD_FROM

ARG LEGO_VERSION
ARG BUILD_ARCH

RUN wget -O /tmp/lego.tar.gz https://github.com/go-acme/lego/releases/download/v${LEGO_VERSION}/lego_v${LEGO_VERSION}_linux_${BUILD_ARCH}.tar.gz && \
    tar x -f /tmp/lego.tar.gz  -C /usr/bin/ && \
    rm -f /tmp/lego.tar.gz

COPY rootfs /

ARG BUILD_FROM=homeassistant/amd64-base:3.11
FROM $BUILD_FROM

RUN apk add mosquitto-clients ipmitool

COPY rootfs /

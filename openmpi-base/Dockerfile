FROM bitnami/minideb:latest

LABEL maintainer="Teodor Simchev <teodor.simchev@gmail.com>"

# TODO - convert to build argument
ENV OPENMPI_VERSION=4.0.0

COPY rootfs /

RUN /on_build.sh

RUN rm -f /openmpi.sh
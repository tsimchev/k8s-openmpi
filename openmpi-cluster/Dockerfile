FROM gcr.io/massive-sandbox-235519/openmpi-base

LABEL maintainer="Teodor Simchev <teodor.simchev@gmail.com>"

COPY rootfs /

RUN /on_build.sh

EXPOSE 22

ENTRYPOINT [ "/bin/bash", "/on_start.sh" ]

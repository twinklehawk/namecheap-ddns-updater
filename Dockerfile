FROM alpine:3.18

LABEL org.opencontainers.image.title=namecheap-ddns-updater
LABEL org.opencontainers.image.url=https://github.com/twinklehawk/namecheap-ddns-updater
LABEL org.opencontainers.image.source=https://github.com/twinklehawk/namecheap-ddns-updater
LABEL org.opencontainers.image.description="Script to update a host's IP address when using Namecheap DDNS"
LABEL org.opencontainers.image.licenses=Apache-2.0

RUN apk add --no-cache curl bind-tools

COPY update-ddns.sh /

RUN groupadd -r updater && useradd --no-log-init -r -g updater updater
USER updater

ENTRYPOINT ["/update-ddns.sh"]

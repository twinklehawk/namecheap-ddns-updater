FROM alpine:3.24@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4

LABEL org.opencontainers.image.title=namecheap-ddns-updater
LABEL org.opencontainers.image.url=https://github.com/twinklehawk/namecheap-ddns-updater
LABEL org.opencontainers.image.source=https://github.com/twinklehawk/namecheap-ddns-updater
LABEL org.opencontainers.image.description="Script to update a host's IP address when using Namecheap DDNS"
LABEL org.opencontainers.image.licenses=Apache-2.0

RUN apk add --no-cache curl bind-tools
RUN adduser -D -H updater

COPY update-ddns.sh /

USER updater
ENTRYPOINT ["/update-ddns.sh"]

FROM alpine:3.24@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a

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

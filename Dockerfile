FROM alpine:3.23@sha256:51183f2cfa6320055da30872f211093f9ff1d3cf06f39a0bdb212314c5dc7375

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

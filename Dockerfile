FROM alpine:3.22@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1

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

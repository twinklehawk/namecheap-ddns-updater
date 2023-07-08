#!/bin/sh
set -euo pipefail

if [ -z "${DDNS_HOST:-}" ]; then
  echo "DDNS_HOST envvar must be set"
  exit 1
fi
if [ -z "${DDNS_DOMAIN:-}" ]; then
  echo "DDNS_DOMAIN envvar must be set"
  exit 1
fi
if [ -z "${DDNS_PASSWORD:-}" ]; then
  echo "DDNS_PASSWORD envvar must be set"
  exit 1
fi

echo "Checking for IP address changes"

last_ip=$(dig +short "$DDNS_HOST.$DDNS_DOMAIN")
if [ -z "${last_ip:-}" ]; then
  echo "Unable to get last IP address"
  exit 1
fi
public_ip=$(curl -s -S https://ifconfig.me/ip)
if [ -z "${public_ip:-}" ]; then
  echo "Unable to get current IP address"
  exit 1
fi

echo "Last IP address: $last_ip"
echo "New IP address: $public_ip"

if [ "$last_ip" != "$public_ip" ]; then
  echo "Setting IP for $DDNS_HOST.$DDNS_DOMAIN to $public_ip"
  curl -s -S "https://dynamicdns.park-your-domain.com/update?host=$DDNS_HOST&domain=$DDNS_DOMAIN&password=$DDNS_PASSWORD&ip=$public_ip"
else
  echo "Skipping update"
fi

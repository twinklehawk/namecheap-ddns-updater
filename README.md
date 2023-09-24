# namecheap-ddns-updater
Script to update a host's IP address when using Namecheap's DDNS

The script determines your current IP address by querying `https://ifconfig.me/ip`, compares it to the IP address currently set for the domain using `dig`, and then updates the IP address if necessary.

## Usage
Set the required environment variables and then execute the script
```bash
export DDNS_HOST=example.com  # the base namecheap domain
export DDNS_DOMAIN=subdomain  # the subdomain set up with DDNS to update
export DDNS_PASSWORD=examplepassword  # the DDNS password from the namecheap console
./update-ddns.sh
```

The docker image requires setting up the same three environment variables
```bash
docker run -e DDNS_HOST=example.com -e DDNS_DOMAIN=subdomain -e DDNS_PASSWORD=examplepassword --rm ghcr.io/twinklehawk/namecheap-ddns-updater:1.0.0
```

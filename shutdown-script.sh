#!/bin/bash
sudo docker run --rm \
  -e CLOUDFLARE_API_KEY=SOME_CLOUDFLARE_KEY \
  -e CLOUDFLARE_EMAIL=email@example.com \
  -e CLOUDFLARE_WEBSITE=example.com \
  -e SUBDOMAIN=servers \
  jamrizzi/dns-register:latest unregister

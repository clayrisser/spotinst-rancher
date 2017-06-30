#!/bin/bash
curl -L https://releases.rancher.com/install-docker/1.12.sh | sudo sh
sudo docker run --rm --privileged \
-e CATTLE_HOST_LABELS="spotinst.instanceId=`curl http://169.254.169.254/latest/meta-data/instance-id`" \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /var/lib/rancher:/var/lib/rancher \
rancher/agent:v1.2.2 \
https://rancher.example.com/v1/scripts/SOME_RANCHER_TOKEN
sudo docker run --rm \
  -e CLOUDFLARE_API_KEY=SOME_CLOUDFLARE_KEY \
  -e CLOUDFLARE_EMAIL=email@example.com \
  -e CLOUDFLARE_WEBSITE=example.com \
  -e SUBDOMAIN=servers \
  jamrizzi/dns-register:latest register
sudo curl -fsSL http://s3.amazonaws.com/spotinst-labs/spotinst-agent/agent-init.sh | \
SPOTINST_TOKEN=SOME_SPOTINST_TOKEN bash

#!/bin/bash
source ../bin/settings.ini
if [ "$(which docker)" != "0" ]; then
	curl -sSL https://get.docker.io/ubuntu/ | sudo sh
fi
docker build --rm -t "${DOCKER_REGISTRY}/ubuntu" .

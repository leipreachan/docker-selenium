#!/bin/bash
source ../bin/settings.ini
docker build --rm -t "${DOCKER_REGISTRY}/phantomjs" .

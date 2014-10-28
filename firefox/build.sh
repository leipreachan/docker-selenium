#!/bin/bash
source ../bin/settings.ini
cp ../bin/vnc_settings.ini bin/vnc_settings.ini
cp ../bin/vnc.sh bin/
docker build --rm -t "${DOCKER_REGISTRY}/firefox" .
rm bin/vnc.sh
rm bin/vnc_settings.ini

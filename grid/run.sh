#!/bin/bash
source ../bin/settings.ini

echo "Starting selenium grid on port $SELENIUM_PORT"
docker run -d -i -e SELENIUM_PORT=$SELENIUM_PORT -v $LOGS_FOLDER_LOCAL:$LOGS_FOLDER_DOCKER -p $SELENIUM_PORT:$SELENIUM_PORT --name="selenium-grid-$SELENIUM_PORT" -t "${DOCKER_REGISTRY}/grid" | tee ../grid.pid
_ok ${PIPESTATUS[0]} "http://$LOCAL_IP:$SELENIUM_PORT$NODE_ADDR"

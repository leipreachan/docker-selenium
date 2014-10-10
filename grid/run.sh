#!/bin/bash
source ../bin/settings.ini

docker run -d -i -e SELENIUM_PORT=$SELENIUM_PORT -v $LOGS_FOLDER_LOCAL:$LOGS_FOLDER_DOCKER -p $SELENIUM_PORT:$SELENIUM_PORT --name="selenium-grid-$SELENIUM_PORT" -t selenium/grid | tee ../grid.pid

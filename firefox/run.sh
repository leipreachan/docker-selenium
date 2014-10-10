#!/bin/bash
source ../bin/settings.ini

docker run -d -i $HUB_ADDRESS -p $VNC_PORT:$VNC_PORT -p $SELENIUM_PORT:$SELENIUM_PORT -e VNC_PORT=$VNC_PORT -e SELENIUM_PORT=$SELENIUM_PORT $SHARES --name="selenium-firefox-$SELENIUM_PORT-$VNC_PORT" -t selenium/firefox | tee ../firefox-${SELENIUM_PORT}.pid

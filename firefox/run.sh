#!/bin/bash
source ../bin/settings.ini

docker run --rm --net=host -i $HUB_ADDRESS -e VNC_PORT=$VNC_PORT -e SELENIUM_PORT=$SELENIUM_PORT $SHARES --name="selenium-firefox-$SELENIUM_PORT-$VNC_PORT" -t selenium/firefox

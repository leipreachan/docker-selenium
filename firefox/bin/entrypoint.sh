#!/usr/bin/env bash

export DISPLAY=${DISPLAY}
/home/selenium/bin/vnc.sh

sudo -E -i -u ${SELENIUM_USER} \
    java -jar ${SELENIUM_PATH} \
	-port ${SELENIUM_PORT} \
	-registerCycle 30000 \
	-Dwebdriver.firefox.bin=${FIREFOX_PATH} \
	-browser seleniumProtocol=WebDriver,browserName=firefox,version=${FIREFOX_PATH},maxInstances=2,platform=LINUX > /var/log/selenium/selenium-firefox-${SELENIUM_PORT}.log 2>&1

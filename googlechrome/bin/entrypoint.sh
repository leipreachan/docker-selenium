#!/usr/bin/env bash

export DISPLAY=${DISPLAY}
/home/selenium/bin/vnc.sh

CHROME_VERSION=$(cat /home/selenium/google-chrome-version)

sudo -E -i -u ${SELENIUM_USER} \
	java -jar ${SELENIUM_PATH} \
		-port ${SELENIUM_PORT} \
		-registerCycle 30000 \
		-browser browserName=chrome,version=${CHROME_VERSION},maxInstances=4,platform=LINUX,chrome.binary=/usr/bin/google-chrome \
		-Dwebdriver.chrome.driver=/home/selenium/chromedriver > /var/log/selenium/selenium-chrome-${SELENIUM_PORT}.log 2>&1

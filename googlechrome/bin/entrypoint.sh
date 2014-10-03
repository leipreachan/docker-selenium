#!/bin/bash
export DISPLAY=${DISPLAY}
/home/selenium/bin/vnc.sh
CHROME_VERSION=$(cat /home/selenium/google-chrome-version)

if [ -n "$HUB_ADDRESS" ];
then
	SELENIUM_GRID="-role node -hub http://$HUB_ADDRESS/grid/register"
fi

sudo -E -i -u ${SELENIUM_USER} \
	java -jar ${SELENIUM_PATH} \
		-port ${SELENIUM_PORT} \
		$SELENIUM_GRID \
		-registerCycle 30000 \
		-Dwebdriver.chrome.driver=/home/selenium/chromedriver \
		-browser seleniumProtocol=WebDriver,browserName=chrome,version=${CHROME_VERSION},maxInstances=1,platform=LINUX,chrome.binary=/usr/bin/google-chrome  > /var/log/selenium/selenium-chrome-${SELENIUM_PORT}.log 2>&1

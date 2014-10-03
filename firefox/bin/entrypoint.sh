#!/usr/bin/env bash
export DISPLAY=${DISPLAY}
/home/selenium/bin/vnc.sh
FIREFOX_VERSION=$(cat /home/selenium/firefox-version)

if [ -n "$HUB_ADDRESS" ];
then
	SELENIUM_GRID="-role node -hub http://$HUB_ADDRESS/grid/register"
fi

sudo -E -i -u ${SELENIUM_USER} \
    java -jar ${SELENIUM_PATH} \
		-port ${SELENIUM_PORT} \
		$SELENIUM_GRID \
		-registerCycle 30000 \
		-Dwebdriver.firefox.bin=${FIREFOX_PATH} \
		-browser seleniumProtocol=WebDriver,browserName=firefox,version=${FIREFOX_VERSION},maxInstances=1,platform=LINUX > /var/log/selenium/selenium-firefox-${SELENIUM_PORT}.log 2>&1

#!/usr/bin/env bash
if [ -n "$HUB_ADDRESS" ];
then
	SELENIUM_GRID="-role node -hub http://$HUB_ADDRESS/grid/register"
fi

if [ -z "$NUMBER_OF_NODES" ];
then
	NUMBER_OF_NODES=1
fi

sudo -E -i -u ${SELENIUM_USER} \
    java -jar ${SELENIUM_PATH} \
		-port ${SELENIUM_PORT} \
		$SELENIUM_GRID \
		-registerCycle 30000 \
		-browser browserName=phantomjs,version=${PHANTOMJS_VERSION},maxInstances=${NUMBER_OF_NODES},platform=LINUX \
		-Dphantomjs.binary.path=/home/selenium/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/phantomjs > /var/log/selenium/selenium-phantomjs-${SELENIUM_PORT}.log 2>&1

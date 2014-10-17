#!/bin/bash
source ../bin/settings.ini

function _run()
{
	name="phantomjs"
 	docker run -d -i $HUB_ADDRESS -e NUMBER_OF_NODES=$NUMBER_OF_NODES -p $SELENIUM_PORT:$SELENIUM_PORT -e SELENIUM_PORT=$SELENIUM_PORT $SHARES --name="selenium-${name}-$SELENIUM_PORT-$VNC_PORT"  -t "selenium/${name}" | tee ../${name}-${SELENIUM_PORT}.pid && _ok "http://$LOCAL_IP:$SELENIUM_PORT$NODE_ADDR"
}

_run

#!/bin/bash
source ../bin/settings.ini

function _run()
{
	name="googlechrome"
	docker run -d -i $HUB_ADDRESS -p $VNC_PORT:$VNC_PORT -p $SELENIUM_PORT:$SELENIUM_PORT -e VNC_PORT=$VNC_PORT -e SELENIUM_PORT=$SELENIUM_PORT $SHARES --name="selenium-${name}-$SELENIUM_PORT-$VNC_PORT"  -t "selenium/${name}" | tee ../${name}-${SELENIUM_PORT}.pid
	_ok ${PIPESTATUS[0]} "http://$LOCAL_IP:$SELENIUM_PORT$NODE_ADDR"
}

_run 

if [ -n "$NUMBER_OF_NODES" ]; then
	for (( i=1; i<$NUMBER_OF_NODES; i++ )); do
		SELENIUM_PORT=$((SELENIUM_PORT+i))
		VNC_PORT=$((VNC_PORT+i))
		_run 
	done
fi

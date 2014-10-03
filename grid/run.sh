#!/bin/bash
if [ -z "$1" ]; then
	SELENIUM_PORT=5555
else 
	SELENIUM_PORT=$1
fi

docker run -i -e SELENIUM_PORT=$SELENIUM_PORT -p $SELENIUM_PORT:$SELENIUM_PORT -v /var/log/docker-selenium-grid:/var/log/selenium -t selenium/grid

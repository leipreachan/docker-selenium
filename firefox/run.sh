#!/bin/bash
source ./bin/settings.ini

if [ -z "$1" ]; then
	SELENIUM_PORT=4501
else 
	SELENIUM_PORT=$1
fi
if [ -z "$2" ]; then
	VNC_PORT=5900
else
	VNC_PORT=$2
fi

docker run --rm --net=host -i -e VNC_PORT=$VNC_PORT -e SELENIUM_PORT=$SELENIUM_PORT -v /home/selenium/PhotosForTests:/home/selenium/PhotosForTests -v /var/log/docker-selenium:/var/log/selenium -t selenium/firefox

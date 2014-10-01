#!/bin/bash
d=`which docker`
if [ "$?" != 0 ]; then
	curl -sSL https://get.docker.io/ubuntu/ | sudo sh
fi
docker build --rm -t "selenium/ubuntu" .

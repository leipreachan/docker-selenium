#!/bin/bash
d=`which docker`
if [ "$?" != 0 ]; then
	curl -sSL https://get.docker.io/ubuntu/ | sudo sh
fi
time docker build --rm -t "selenium/ubuntu" .

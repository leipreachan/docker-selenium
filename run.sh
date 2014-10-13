#!/bin/bash

if [ -n "$(bash --version | grep apple)" ]; then
	if [ "$(boot2docker status)" == "poweroff" ]; then
		boot2docker up
	fi
fi

NUMBER_OF_NODES=2

if [ -n "$1" ]; then
	NUMBER_OF_NODES=$1
fi

LOCAL_IP=$(/sbin/ifconfig | egrep 'inet.*192' | sed 's/addr:/ /g' | awk '{print $2}')
cd grid && ./run.sh 5555
cd ../firefox && ./run.sh 4501 5900 $LOCAL_IP:5555 $NUMBER_OF_NODES
cd ../googlechrome && ./run.sh 4551 5951 $LOCAL_IP:5555 $NUMBER_OF_NODES
cd ../phantomjs && ./run.sh 4601 6000 $LOCAL_IP:5555 $NUMBER_OF_NODES

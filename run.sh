#!/bin/bash

NUMBER_OF_NODES=2

if [ -n "$1" ]; then
	NUMBER_OF_NODES=$1
fi

LOCAL_IP=$(/sbin/ifconfig | egrep 'inet addr' | grep '192' | sed 's/:/ /g' | awk '{print $3}')
cd grid && ./run.sh 5555
cd ../firefox && ./run.sh 4501 5900 $LOCAL_IP:5555 $NUMBER_OF_NODES
cd ../googlechrome && ./run.sh 4551 5951 $LOCAL_IP:5555 $NUMBER_OF_NODES
cd ../phantomjs && ./run.sh 4601 6000 $LOCAL_IP:5555 $NUMBER_OF_NODES

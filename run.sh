#!/bin/bash

NUMBER_OF_NODES=5

if [ -n "$1" ]; then
	NUMBER_OF_NODES=$1
fi

cd grid && ./run.sh 5555
cd ../firefox && ./run.sh 4501 5900 192.168.3.38:5555 $NUMBER_OF_NODES
cd ../googlechrome && ./run.sh 4551 5951 192.168.3.38:5555 $NUMBER_OF_NODES

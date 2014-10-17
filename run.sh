#!/bin/bash
GRID_PORT=5555
FF_PORT=4501
FF_VNC_PORT=5901
GCHROME_PORT=4551
GCHROME_VNC_PORT=5951
PHANTOMJS_PORT=4601
NUMBER_OF_NODES=2
LOCAL_IP=$(/sbin/ifconfig | egrep 'inet.*192' | sed 's/addr:/ /g' | awk '{print $2}')

if [ -n "$(bash --version | grep apple)" ]; then
	if [ "$(boot2docker status)" == "poweroff" ]; then
		boot2docker up
	fi
fi

if [ -n "$1" ]; then
	NUMBER_OF_NODES=$1
fi

function _run()
{
	local NAME="$1"
	local PORT="$2"
	local VNC_PORT="$3"
	echo -e "\nStarting $NUMBER_OF_NODES $NAME nodes (selenium ports: $PORT..$((PORT+NUMBER_OF_NODES-1)), vnc ports: $VNC_PORT..$((VNC_PORT+NUMBER_OF_NODES-1)))"
	cd ../$NAME && ./run.sh $PORT $VNC_PORT $LOCAL_IP:$GRID_PORT $NUMBER_OF_NODES 
}

cd grid && ./run.sh $GRID_PORT
_run firefox $FF_PORT $FF_VNC_PORT
_run googlechrome $GCHROME_PORT $GCHROME_VNC_PORT
_run phantomjs $PHANTOMJS_PORT 6000


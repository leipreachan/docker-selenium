#!/bin/bash

if [ -n "$(bash --version | grep apple)" ]; then
	if [ -z "$(which boot2docker)" ]; then
		echo "Please, install boot2docker from this page: https://github.com/boot2docker/osx-installer/releases then restart this script"
		exit 1
	fi
	boot2docker init
	if [ "$(boot2docker status)" == "poweroff" ]; then
		boot2docker up
	fi
fi

browsers=( "cd firefox && ./build.sh" "cd googlechrome && ./build.sh" "cd grid && ./build.sh" "cd phantomjs && ./build.sh" )
size=${#browsers[@]}

cd ubuntu && ./build.sh && cd ../ && printf '%s\n' "${browsers[@]}" | xargs -P $size -I{} -t sh -c "{}"

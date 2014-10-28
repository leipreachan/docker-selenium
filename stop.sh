#!/bin/bash
source bin/settings.ini
by_pid=$(cat *.pid)
if [ -n "$by_pid" ]; then
	echo "kill docker containers by known ids"
	docker kill $by_pid && echo -e "[\e[01;32mOK\e[00m]\n"
	echo "remove old docker containers by known ids"
	docker rm $by_pid && rm *.pid && echo -e "[\e[01;32mOK\e[00m]\n"
fi
by_name=$(docker ps -a | grep "${DOCKER_REGISTRY}" | awk '{print $1}')
if [ -n "$by_name" ]; then
	echo "kill docker containers with name selenium*"
	docker kill $by_name && echo -e "[\e[01;32mOK\e[00m]\n"
	echo "remove docker containers with name selenium*"
	docker rm $by_name && echo -e "[\e[01;32mOK\e[00m]\n"
fi

#!/bin/bash

docker kill $(cat *.pid)
docker rm $(cat *.pid) && rm *.pid

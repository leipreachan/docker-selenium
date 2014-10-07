# Installation

`git clone https://github.com/leipreachan/docker-selenium`

## Linux

`sudo ./build.sh`

### Run as standalone nodes

`cd firefox && sudo ./run.sh`

`cd googlechrome && sudo ./run.sh`

### Run as GRID nodes

`cd grid && sudo ./run.sh 5555`

> 5555 is the grid hub port by default

`cd firefox && sudo ./run.sh 4501 5900 localhost:5555`

> 4501 - default selenium-firefox node port

> 5900 - default selenium-firefox vnc port

`cd googlechrome && sudo ./run.sh 4551 5951 localhost:5555`

> 4551 - default selenium-googlechrome node port

> 5951 - default selenium-googlechrome vnc port

voila!

## MacOS install

http://docs.docker.com/installation/mac/

no need "sudo"

## Windows install

http://docs.docker.com/installation/windows/

no need "sudo"

## Issues

Folder sharing doesn't work "from the box right now". Will be fixed soon

### someting to read

https://github.com/boot2docker/boot2docker/blob/master/doc/WORKAROUNDS.md

MacOS port sharing: https://github.com/docker/docker/issues/4007

https://coderwall.com/p/fvfjyg

# Installation

`git clone https://github.com/leipreachan/docker-selenium`

`sudo ./build.sh`

### Run as standalone nodes

`cd firefox && sudo ./run.sh [selenium_port=4501] [vnc_port=5901]`

`cd googlechrome && sudo ./run.sh [selenium_port=4501] [vnc_port=5901]`

`cd phantomjs && sudo ./run.sh [selenium_port=4501] [vnc_port=5901]`

### Run as GRID nodes

`sudo ./run.sh [number_of_nodes=2]`

> 5555 is the grid hub port by default

it will start selenium grid and selected number of nodes of selenium WD with firefox, two with chrome and two with phantomjs

`sudo ./stop.sh [number_of_nodes=2]`

stops all the known instances of selenium nodes and grid

voila!

## Linux install

./build.sh script checks and installs docker itself

## MacOS install

Install boot2docker first: http://docs.docker.com/installation/mac/

no need "sudo"

## Windows install

Install boot2docker first: http://docs.docker.com/installation/windows/

no need "sudo"
## Issues

Folder sharing doesn't work "from the box right now". Will be fixed soon

### someting to read

https://github.com/boot2docker/boot2docker/blob/master/doc/WORKAROUNDS.md

MacOS port sharing: https://github.com/docker/docker/issues/4007

https://coderwall.com/p/fvfjyg

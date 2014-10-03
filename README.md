git clone https://github.com/leipreachan/docker-selenium

Linux:

sudo ./build.sh

 standalone

cd firefox && sudo ./run.sh

or

cd googlechrome && sudo ./run.sh


 GRID

cd grid && sudo ./run.sh 5555

cd firefox && sudo ./run.sh 4501 5900 localhost:5555

cd googlechrome && sudo ./run.sh 4502 5901 localhost:5555

voila!


MacOS: http://docs.docker.com/installation/mac/ (no need sudo)

#!/bin/bash
cp ../bin/vnc.sh bin/vnc.sh
docker build --rm -t "selenium/googlechrome" . 
rm bin/vnc.sh

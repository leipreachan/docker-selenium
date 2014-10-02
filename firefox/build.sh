#!/bin/bash

cp ../bin/vnc.sh bin/vnc.sh
docker build --rm -t "selenium/firefox" .
rm bin/vnc.sh

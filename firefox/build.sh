#!/bin/bash
cp ../bin/vnc.sh bin/vnc.sh
time docker build --rm -t "selenium/firefox" .
rm bin/vnc.sh

#!/bin/bash

cd grid && ./run.sh 5555
cd ../firefox && ./run.sh 4501 5900 localhost:5555
cd ../googlechrome && ./run.sh 4551 5951 localhost:5555

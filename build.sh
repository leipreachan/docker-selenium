#!/bin/bash

browsers=( "cd firefox && ./build.sh" "cd googlechrome && ./build.sh" "cd grid && ./build.sh" )
size=${#browsers[@]}

cd ubuntu && ./build.sh && cd ../ && printf '%s\n' "${browsers[@]}" | xargs -P $size -i -t sh -c "{}"

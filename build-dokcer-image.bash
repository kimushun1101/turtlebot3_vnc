#!/bin/bash

file_dir=`dirname $0`

# build docker images
docker build -t kimura/turtlebot3-vnc \
    ${file_dir}

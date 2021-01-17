#!/bin/bash
port="6080"

# run docker
xdg-open "http://127.0.0.1:${port}" & \
docker run --rm \
  -p ${port}:80\
  --shm-size=512m \
  -it --name "turtlebot3-vnc" kimura/turtlebot3-vnc

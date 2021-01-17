#! /bin/bash
source /opt/ros/foxy/setup.bash
cd ~/turtlebot3_ws && colcon build --symlink-install
source ~/turtlebot3_ws/install/setup.bash

export ROS_DOMAIN_ID=30 #TURTLEBOT3
export TURTLEBOT3_MODEL=waffle
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py

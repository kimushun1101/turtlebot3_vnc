FROM tiryoh/ros2-desktop-vnc:foxy

LABEL maintainer="Shunsuke Kimura <kimushun1101@gmail.com>"

# Install packages for turtlebot3
# RUN curl -sSL http://get.gazebosim.org | sh \
#   && apt install -y ros-foxy-gazebo-ros-pkgs \
RUN apt update && apt upgrade -y && apt autoremove -y \
  && apt install -y ros-foxy-cartographer ros-foxy-cartographer-ros \
  && apt install -y ros-foxy-navigation2 ros-foxy-nav2-bringup \
  && apt install -y python3-vcstool \
  && apt install -y ros-foxy-turtlebot3 ros-foxy-turtlebot3-msgs

# Install packages for turtlebot3 from Github
RUN mkdir -p ~/turtlebot3_ws/src \
  && cd ~/turtlebot3_ws/src \
  && git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git \
  # && cd ~/turtlebot3_ws && colcon build --symlink-install \ # CMake Error
  && echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc \
  && echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc

# copy startup script
COPY src/start.bash /start.bash
RUN chmod 777 /start.bash && mv /start.bash ~

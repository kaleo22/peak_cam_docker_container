#!/bin/bash

set -e

source /opt/ros/humble/setup.bash
source /ros_ws/peak_cam/install/setup.bash


export ROS_DOMAIN_ID=10


export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export FASTRTPS_DEFAULT_PROFILES_FILE=/var/tmp/husarnet-fastdds-ds-client.xml
export ROS_DISCOVERY_SERVER=1:0.0.0.0:11888
husarnet-dds singleshot

exec "$@"
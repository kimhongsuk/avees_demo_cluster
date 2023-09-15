#!/bin/bash
# configure.sh

# Make
cd ~/ros2_ws/src/avees_demo_cluster/src/cluster
qmake .
make -j6
tag: terminal
-

ROS two rqt graph:
    "ros2 run rqt_graph rqt_graph"
    key(enter)

ROS two view frames:
    "ros2 run tf2_tools view_frames"
    key(enter)

ROS two transform echo:
    "ros2 run tf2_ros tf2_echo "

# Build everything
colcon build:
    "colcon build --symlink-install "

# # build only this package
# TODO: Figure out the right capture to work with "foo" (w/o saying 'word'?) "foo_bar" (snake foo bar) and "rqt_foo" (red queen trap underscore word foo)
colcon build <user.prose>:
    "colcon build --symlink-install --packages-select {prose}"

# build dependencies and this package
# colcon build <user.text>:
#    "colcon build --symlink-install --packages-up-to {text}"

ROS two create C package:
    "ros2 pkg create --build-type ament_cmake --license BSD-3-Clause "

ROS two create python package:
    "ros2 pkg create --build-type ament_python --license BSD-3-Clause "

# Source various files ...
source kilted:
    "source /opt/ros/kilted/setup.bash"
    key(enter)
# On the docker image, this will be at docking_ws/local/...
# I need to ask Marc about his script to properly source the parent file.
source local:
    "source install/local_setup.bash"
    key(enter)
source setup:
    "source install/setup.bash"
    key(enter)

ROS two run:
    "ros2 run "

#################
# ACTION
ROS two action list:
    "ros2 action list"
    key(enter)

#################
# COMPONENT
ROS two component help:
    "ros2 component --help"
    key(enter)

ROS two component list:
    "ros2 component list"
    key(enter)

ROS two component types:
    "ros2 component types"
    key(enter)

#################
# INTERFACE
ROS two interface show:
    "ros2 interface show "

ROS two interface show that:
    text = edit.selected_text()
    "ros2 interface show {text}"
    key(enter)

#############
# NODE
ROS two node list:
    "ros2 node list"
    key(enter)

ROS two node info:
    "ros2 node info "

ROS two node info that:
    text = edit.selected_text()
    "ros2 node info {text}"
    key(enter)

############
# PACKAGE
# I suspect that there will be more package commands that I care about ...
ROS two package executables:
    "ros2 pkg executables "

###########
# PARAM

ROS two param help:
    "ros2 param --help"
    key(enter)

ROS two param dump:
    "ros2 param dump"
    key(enter)

ROS two param list:
    "ros2 param list"
    key(enter)

ROS two param set:
    "ros2 param set "

###########
# SERVICE
ROS two service list:
    "ros2 service list"
    key(enter)

ROS two service info:
    "ros2 service info "

############
# TOPIC
# NYI: bw, delay, echo, find, hz, pub, type
ROS two topic list: "ros2 topic list"
    key(enter)

ROS two topic list types:
    "ros2 topic list -t"
    key(enter)

ROS two topic list hidden:
    "ros2 topic list --include-hidden-topics"
    key(enter)

ROS two topic list hidden types:
    "ros2 topic list -t --include-hidden-topics"
    key(enter)

ROS two topic info:
    "ros2 topic info "

ROS two topic info verbose:
    "ros2 topic info --verbose "

ROS two topic info that:
    text = edit.selected_text()
    "ros2 topic info {text}"
    key(enter)

# NB -- there are a lot of args that I'm not adding right now...
#
ROS two topic echo:
    "ros2 topic echo "

ROS two topic echo once:
    "ros2 topic echo --once "

ROS two topic echo that:
    text = edit.selected_text()
    "ros2 topic echo {text}"
    key(enter)

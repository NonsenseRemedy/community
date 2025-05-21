tag: terminal
-

roscd: "roscd "

roscore:
    "roscore"
    key(enter)

rosdep install:
    "rosdep install --from-paths src --ignore-src -r -y"

##########
# probably-temporary until I do a more thorough catkin command set
catkin build:
    "catkin build "

catkin build all:
    "catkin build"
    key(enter)

catkin clean:
    "catkin clean"
    key(enter)

rqt graph:
    "rqt_graph"
    key(enter)

view frames:
    "rosrun tf2_tools view_frames.py"
    key(enter)

# TODO: this should move into a proper ROS tool with support for flags
# (tea | tee) eff echo:
transform echo:
    "rosrun tf2_tools echo.py "

vcs import:
    "vcs import --recursive --input "

vcs pull:
    "vcs pull "

vcs status:
    "vcs status \n"


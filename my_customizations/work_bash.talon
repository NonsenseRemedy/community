tag: user.bash
-

manip:
    "manip"
    key(enter)



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

view frames:
    "rosrun tf2_tools view_frames.py"
    key(enter)

# TODO: this should move into a proper ROS tool with support for flags
# (tea | tee) eff echo:
transform echo:
    "rosrun tf2_tools echo.py "

# bash voice commands specifically for use at work that rely on
# bashrc aliases
# Export the AWS keys to access the trisect data
export trisect dvc:
    "trisect_dvc"
    key(enter)

zerotier join opal:
    "join_zerotier_opal"
    key(enter)

zerotier join desktop:
    "join_zerotier_desktop"
    key(enter)

# TODO: this should use a capture to also support other virtual environments,
#      but for now, doing it the easy way that I know how
activate dvc:
    "source ~/environments/dvc/bin/activate"
    key(enter)

# TODO: this should probably use an environment variable to find the root data directory. For now, this only works on my desktop at home
trisect data:
    "cd /zvol1/trisect_data"
    key(enter)

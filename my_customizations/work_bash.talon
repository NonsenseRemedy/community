tag: user.bash
-

manip:
    "manip"
    key(enter)

# probably-temporary until I do a more thorough catkin command set
catkin build:
    "catkin build"
    key(enter)

# bash voice commands specifically for use at work
export trisect dvc:
    "trisect_dvc"
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

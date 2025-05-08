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

##########
# temporary until I do a full-featured tmux set

mux: "tmux "

mux list sessions:
    "tmux list-sessions"
    key(enter)

mux kill session:
    key(ctrl-b)
    key(:)
    "kill-session"

mux detach:
    key(ctrl-b)
    key(d)


mux win <number_small>:
    key(ctrl-b)
    key('{number_small}')

mux win close:
    key(ctrl-b)
    key(&)

mux win new:
    key(ctrl-b)
    key(c)

mux win last:
    key(ctrl-b)
    key(p)
mux win next:
    key(ctrl-b)
    key(n)
mux win rename:
    key(ctrl-b)
    key(,)

# matching the sense of the community split commands, where "vert"
# creates two columns.
mux split vert:
    key(ctrl-b)
    key(%)
mux split across:
    key(ctrl-b)
    key(")
mux pane next:
    key(ctrl-b)
    key(o)
mux move <user.arrow_key>:
    key(ctrl-b)
    key(arrow_key)

mux pane close:
    key(ctrl-b)
    key(x)




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

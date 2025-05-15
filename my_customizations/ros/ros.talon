tag: terminal
-

roscd: "roscd "

roscore:
    "roscore"
    key(enter)

rosdep install:
    "rosdep install --from-paths src --ignore-src -r -y"

vcs import:
    "vcs import --recursive --input "

vcs pull:
    "vcs pull "
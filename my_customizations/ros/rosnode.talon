tag: terminal
-



##### ROSNODE CLEANUP

rosnode cleanup: "rosnode cleanup"
rosnode cleanup help:
    "rosnode cleanup --help /n"

##### ROSNODE INFO

rosnode info help: "rosnode info --help \n"
rosnode info: "rosnode info "
rosnode info quiet: "rosnode info --quiet "

rosnode info (this | that):
    text = edit.selected_text()
    "rosnode info {text} "
rosnode info quiet (this | that):
    text = edit.selected_text()
    "rosnode info --quiet {text} "

rosnode info paste:
    text = edit.selected_text()
    "rosnode info {clip.text()} "
rosnode info quiet paste:
    text = edit.selected_text()
    "rosnode info --quiet {clip.text()} "


##### ROSNODE KILL

rosnode kill help: "rosnode kill --help \n"
rosnode kill all: "rosnode kill --all \n"

rosnode kill:
    "rosnode kill "

rosnode kill (this | that):
    text = edit.selected_text()
    "rosnode kill {text} "

rosnode kill paste:
    text = edit.selected_text()
    "rosnode kill {clip.text()} "


##### ROSNODE LIST

rosnode list help: "rosnode list --help \n"
rosnode list all: "rosnode list --all \n"
rosnode list: "rosnode list \n"
rosnode list grep: "rosnode list | grep "


##### ROSNODE MACHINE
# I don't use this at all, so truly minimal implementation
rosnode machine: "rosnode machine "
rosnode machinehelp : "rosnode machine --help \n"

##### ROSNODE PING

rosnode ping help: "rosnode ping --help \n"
rosnode ping all: "rosnode ping --all \n"

rosnode ping [count <number_small>]:
    count = ""
    if number_small or false: count = "-c {number_small} "
    "rosnode ping {count}"

rosnode ping [count <number_small>] (this | that):
    count = ""
    if number_small or false: count = "-c {number_small} "
    text = edit.selected_text()
    "rosnode ping {count} {text} "

rosnode ping [count <number_small>] paste:
    count = ""
    if number_small or false: count = "-c {number_small} "
    text = edit.selected_text()
    "rosnode ping {count} {clip.text()} "




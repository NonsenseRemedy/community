tag: terminal
-

roscore:
    "roscore"
    key(enter)

# NYI rostopic commands: bw, delay, find, hz, pub, type
#############################################
#############################################
# ROSTOPIC ECHO
#
# * -w (fixed width) : NYI since I couldn't figure out how to enforce
#          the numeric argument
# * --bag: needs to be the last one said, but this is not enforced
#          programmatically.
# * -n: count needs to be the first argument, since we handle it separately
#          (I could not figure out how to mix arguments with and without values)

rostopic echo [count <number_small>] [<user.rostopic_echo_args>]:
    count = ""
    if number_small or false: count = " -n {number_small} "
    args = rostopic_echo_args or ""
    "rostopic echo{count}{args}"

    # I'm trying to figure out how to make it not care where this command goes,
    # but I can't figure out how to get it to match two capture groups optionally
    # cmd = "rostopic echo "
    # if number_small_1 or false: cmd += " -n {number_small_1} "
    # if number_small_2 or false: cmd += " -n {number_small_2} "
    # args = rostopic_echo_args or ""
    # cmd += args
    # insert("{cmd}")

rostopic echo [count <number_small>] [<user.rostopic_echo_args>] (this | that):
    count = ""
    if number_small or false: count = " -n {number_small} "
    args = rostopic_echo_args or ""
    text = edit.selected_text()
    "rostopic echo{count}{args} {text}"

rostopic echo [count <number_small>] [<user.rostopic_echo_args>] paste:
    count = ""
    if number_small or false: count = " -n {number_small} "
    args = rostopic_echo_args or ""
    "rostopic echo{count}{args} {clip.text()}"

#############################################
#############################################
# ROSTOPIC INFO
#
# rostopic info doesn't have many options, so no need to use talon lists

rostopic info:
    "rostopic infill "

rostopic list help:
    "rostopic list --help"
    key(enter)

rostopic list:
    "rostopic list "

rostopic list all:
    "rostopic list "
    key(enter)

rostopic list grep <user.text>:
    insert('rostopic list | grep -i "{user.text}"')

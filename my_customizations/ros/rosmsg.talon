tag: terminal
-
# I'm not sure why I can't use "rosmsg" from my custom vocabulary, but it failed to recognize
ros message list: "rosmsg list\n"
ros message list grep: "rosmsg list | grep "
ros message list help: "rosmsg list --help\n"

ros message empty five: "rosmsg md5 "
ros message empty five help: "rosmsg md5 --help\n"

# rosmsg (package | packages)
ros message <user.rosmsg_package_cmd> [<user.rosmsg_package_args>] (this | that):
    cmd = rosmsg_package_cmd
    args = rosmsg_package_args or ""
    text = edit.selected_text()
    "rosmsg {cmd} {args} {text}"

ros message <user.rosmsg_package_cmd> [<user.rosmsg_package_args>]:
    cmd = rosmsg_package_cmd
    args = rosmsg_package_args or ""
    "rosmsg {cmd} {args} "

# rosmsg (info | show)
ros message <user.rosmsg_info_cmd> [<user.rosmsg_info_args>] (this | that):
    cmd = rosmsg_info_cmd
    args = rosmsg_info_args or ""
    text = edit.selected_text()
    "rosmsg {cmd} {args} {text}"

ros message <user.rosmsg_info_cmd> [<user.rosmsg_info_args>]:
    cmd = rosmsg_info_cmd
    args = rosmsg_info_args or ""
    "rosmsg {cmd} {args} "

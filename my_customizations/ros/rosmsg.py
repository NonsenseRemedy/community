from talon import Context, Module

mod = Module()
ctx = Context()

mod.list("rosmsg_package_args", desc="commandline arguments to rosmsg package(s)")
mod.list("rosmsg_package_cmd", desc="commands for rosmsg package(s)")

mod.list("rosmsg_info_args", desc="commandline arguments to rosmsg info")
mod.list("rosmsg_info_cmd", desc="commands that take the same arguments as rosmsg info")


## "rosmsg {list, md5}" only support a single argument
# no need for capture; implemented purely in .talon file


## "rosmsg package" and "rosmsg packages" have the same arguments

# the keys to this can't have spaces
package_free_args = {"help": "--help", "singleline": "-s"}
package_free_arg_group = " | ".join(package_free_args.keys())


@mod.capture(rule=f"({package_free_arg_group})+")
def rosmsg_package_args(m) -> str:
    args = []
    for word in m:
        if flag := package_free_args.get(word):
            args.append(flag)
    return " ".join(args)


@mod.capture(rule="(package | packages)")
def rosmsg_package_cmd(m) -> str:
    return m


## "rosmsg info" and "rosmsg show" take the same arguments
# using the short form for bag in order to avoid wrangling the lack of spaces after the equal sign
info_free_args = {"help": "--help", "raw": "--raw", "bag": "-b"}
info_free_arg_group = " | ".join(info_free_args.keys())


@mod.capture(rule=f"({info_free_arg_group})+")
def rosmsg_info_args(m) -> str:
    args = []
    for word in m:
        if flag := info_free_args.get(word):
            args.append(flag)
    return " ".join(args)


@mod.capture(rule="(info | show)")
def rosmsg_info_cmd(m) -> str:
    return m

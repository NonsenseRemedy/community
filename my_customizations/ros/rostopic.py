from talon import Context, Module

mod = Module()
ctx = Context()

mod.list("rostopic_echo_args", desc="commandline arguments to rostopic echo")
mod.list("rostopic_list_args", desc="commandline arguments to rostopic list")
mod.list("rostopic_hz_args", desc="commandline arguments to rostopic hz")
mod.list("rostopic_delay_args", desc="commandline arguments to rostopic delay")
mod.list("rostopic_pub_args", desc="commandline arguments to rostopic pub")


@mod.capture(rule="{user.rostopic_delay_args}+")
def rostopic_delay_args(m) -> str:
    """A non-empty sequence of rostopic delay command arguments, preceded "by a space."""
    val = " " + " ".join(m.rostopic_delay_args_list)
    if val[-1] != "=":
        val += " "
    return val


@mod.capture(rule="{user.rostopic_echo_args}+")
def rostopic_echo_args(m) -> str:
    """A non-empty sequence of rostopic echo command arguments, preceded "by a space."""
    val = " " + " ".join(m.rostopic_echo_args_list)
    if val[-1] != "=":
        val += " "
    return val


@mod.capture(rule="{user.rostopic_list_args}+")
def rostopic_list_args(m) -> str:
    """A non-empty sequence of rostopic list command arguments, preceded "by a space."""
    val = " " + " ".join(m.rostopic_list_args_list)
    if val[-1] != "=":
        val += " "
    return val


pub_free_args = {
    "help": "--help",
    "verbose": "-v",
    "once": "--once",
    "latch": "--latch",
    "rostime": "--use-rostime",
}
pub_free_arg_group = " | ".join(pub_free_args.keys())


@mod.capture(rule=f"({pub_free_arg_group} | rate <number_small> | file)+")
def rostopic_pub_args(m) -> str:
    args = []
    for word in m:
        if flag := pub_free_args.get(word):
            args.append(flag)

    tokens = str(m).split()
    try:
        idx = tokens.index("rate")
        args += ["-r", tokens[idx + 1]]
    except ValueError as ex:
        print(f"rostopic_pub_args: {ex}")
        pass
    try:
        idx = tokens.index("file")
        args += ["--file="]
    except ValueError as ex:
        print(f"rostopic_pub_args: {ex}")
        pass

    return " ".join(args)


@mod.capture(rule="{user.rostopic_hz_args}+")
def rostopic_hz_args(m) -> str:
    """A non-empty sequence of rostopic hz command arguments, preceded "by a space."""
    val = " " + " ".join(m.rostopic_hz_args_list)
    if val[-1] != "=":
        val += " "
    return val

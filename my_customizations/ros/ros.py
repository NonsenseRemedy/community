from talon import Context, Module

mod = Module()
ctx = Context()

mod.list("rostopic_echo_args", desc="commandline arguments to rostopic echo")

@mod.capture(rule="{user.rostopic_echo_args}+")
def rostopic_echo_args(m) -> str:
    """A non-empty sequence of rostopic echo command arguments, preceded "by a space."""
    val = " " + " ".join(m.rostopic_echo_args_list)
    if val[-1] != "=":
        val += " "
    return val



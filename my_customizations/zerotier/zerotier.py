from talon import Context, Module

mod = Module()
ctx = Context()

mod.list("zerotier_args", desc="commandline arguments to zerotier-cli")

@mod.capture(rule="{user.zerotier_args}+")
def zerotier_args(m) -> str:
    """A non-empty sequence of zerotier command arguments, preceded "by a space."""
    val = " " + " ".join(m.zerotier_args_list)
    if val[-1] != "=":
        val += " "
    return val
import subprocess
import time
from typing import Optional, Union

from talon import Context, Module, actions, settings, ui

mod = Module()
ctx = Context()

mod.tag("i3wm", desc="tag for loading i3wm related files")
# NOTE(LEL): When merging on 21 March 2026, it looks like I had previously had "i3_mod_key" ... I'm not sure where that came  from.
mod.setting(
    "i3_terminal_key",
    type=str,
    default="super-enter",
    desc="The key combination to launch the preferred terminal",
)
mod.setting(
    "i3_launch_key",
    type=str,
    default="super-d",
    desc="The key combination to start the preferred launcher",
)

ctx.matches = r"""
tag: user.i3wm
"""

mod.list("i3wm_resize_dir", desc="Directions for window resizing in i3wm")


@mod.capture(rule="{user.i3wm_resize_dir}+")
def i3wm_resize_dirs(m) -> str:
    "One or more resize directions separated by a space"
    return str(m)


@ctx.action_class("app")
class AppActions:
    def window_close():
        subprocess.check_call(("i3-msg", "kill"))


def i3msg_nocheck(arguments: str):  # type: ignore
    """Call i3-msg on space-separated arguments"""
    subprocess.run(
        ["i3-msg", "--quiet"] + arguments.split(" "),
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        check=False,
    )


# For i3wm we cannot rely on the focusing functions from the UI toolkit, because
# i3wm treats this like the application is trying to acquire focus on its own.
# The default reaction of i3wm to such requests from windows on another
# workspace is to downgrade this to setting the "urgent" flag. Is violates the
# implicit contract of commands like those for the draft editor, which rely on
# the focus commands successfully changing the focus.
def i3wm_focus_window_by_id(id: int):
    actions.user.i3msg(f"[id={id}] focus")


_switcher_focus_windows_to_skip: set[int] = set()


@ctx.action_class("user")
class UserActions:
    def switcher_focus_window(window: ui.Window):  # type: ignore
        i3wm_focus_window_by_id(window.id)

    def switcher_focus(name: str):  # type: ignore
        global _switcher_focus_windows_to_skip
        app = actions.user.get_running_app(name)

        # If app is inactive, focus most recently active window
        if app != ui.active_app():
            i3wm_focus_window_by_id(app.active_window.id)

        # Otherwise, cycle through available windows
        app_window_ids: list[int] = [
            window.id for window in app.windows() if not window.hidden
        ]
        assert len(app_window_ids) > 0

        _switcher_focus_windows_to_skip.add(ui.active_window().id)
        targets = [
            id for id in app_window_ids if id not in _switcher_focus_windows_to_skip
        ]
        if len(targets) > 0:
            # focus new window if one is available
            i3wm_focus_window_by_id(targets[0])
        else:
            # otherwise, focus window that is furthest down the stack
            _switcher_focus_windows_to_skip = set()
            i3wm_focus_window_by_id(app_window_ids[-1])

    def switcher_focus_app(app: ui.App):  # type: ignore
        i3wm_focus_window_by_id(app.active_window.id)

        t1 = time.perf_counter()
        while ui.active_app() != app:
            if time.perf_counter() - t1 > 1:
                raise RuntimeError(f"Can't focus app: {app.name}")
            actions.sleep(0.1)

    # the default implementation considers desktops consecutively numbered
    # this would be highly confusing given the numbering of i3wm workspaces
    def desktop(number: int):  # type: ignore
        actions.user.i3msg(f"workspace number {number}")

    def desktop_next():
        actions.user.i3msg("workspace next")

    def desktop_last():
        actions.user.i3msg("workspace prev")


@mod.action_class
class Actions:
    def i3msg(arguments: str):  # type: ignore
        """Call i3-msg on space-separated arguments"""
        subprocess.check_call(["i3-msg", "--quiet"] + arguments.split(" "))

    def i3wm_resize_window(op: str, amount: int, directions: str):  # type: ignore
        """Resize window by specified amount and direction (in steps of 10 pixels)"""
        for dir in directions.split(" "):
            i3msg_nocheck(f"resize {op} {dir} {10 * amount}")

    def i3wm_layout(layout: Optional[str] = None):  # type: ignore
        """Change to specified layout. Toggle split if unspecified."""
        if layout is None:
            actions.user.i3msg("layout toggle split")
        else:
            actions.user.i3msg(f"layout {layout}")

    def i3wm_launch():
        """Trigger the i3 launcher: ex rofi"""
        key = settings.get("user.i3_launch_key")
        actions.key(key)

    def i3wm_shell():
        """Launch a shell"""
        # key = settings.get("user.i3_terminal_key")
        # actions.key(key)
         key = settings.get("user.i3_mod_key")
         actions.key(f"{key}-enter")

     def i3wm_focus(what: str):
         """Move focus"""
         subprocess.check_call(("i3-msg", "focus", what))

     def i3wm_switch_to_workspace(which: Union[str, int]):
         """Focus the specified workspace"""
         if isinstance(which, int):
             subprocess.check_call(("i3-msg", "workspace", "number", str(which)))
         else:
             subprocess.check_call(("i3-msg", "workspace", which))

     def i3wm_show_scratchpad():
         """Focus/cycle/hide the scratchpad"""
         subprocess.check_call(("i3-msg", "scratchpad", "show"))

     def i3wm_move(to: str):
         """Move the focused container"""
         subprocess.check_call(("i3-msg", "move", to))

     def i3wm_move_to_workspace(which: Union[str, int]):
        """Move the focused container to the specified workspace"""
        if isinstance(which, int):
            subprocess.check_call((
                "i3-msg",
                "move",
                "container",
                "to",
                "workspace",
                "number",
                str(which),
            ))
        else:
            subprocess.check_call((
                "i3-msg",
                "move",
                "container",
                "to",
                "workspace",
                which,
            ))

     def i3wm_move_to_output(which: str):
         """Move the focused container to the specified output."""
         subprocess.check_call(("i3-msg", "move", "container", "to", "output", which))

     def i3wm_move_position(where: str):
         """Move the focused container to the specified position."""
         subprocess.check_call(("i3-msg", "move", "position", where))

     def i3wm_lock():
         """Trigger the lock screen"""
         key = settings.get("user.i3_mod_key")
         actions.key(f"{key}-shift-x")

    def i3wm_logout():
        """Trigger the lock screen"""
        key = settings.get("user.i3_mod_key")
        actions.key(f"{key}-shift-e")

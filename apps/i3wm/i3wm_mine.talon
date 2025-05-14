# NOTE: If you want to use i3wm you must enable the tag settings.talon. i.e.: `tag(): user.i3wm`
# os: linux
tag: user.i3wm
-

(win | window) left: user.i3wm_focus("left")
(win | window) right: user.i3wm_focus("right")
(win | window) up: user.i3wm_focus("up")
(win | window) down: user.i3wm_focus("down")

move (win | window) left: user.i3wm_move("left")
move (win | window) right: user.i3wm_move("right")
move (win | window) up: user.i3wm_move("up")
move (win | window) down: user.i3wm_move("down")

# NB: You can only move to a port that already has an associated window;
# so it is necessary to first move a window and then switch to the port
port <number_small>: user.i3wm_switch_to_workspace(number_small)

port next: user.i3wm_switch_to_workspace("next")
port last: user.i3wm_switch_to_workspace("prev")

move (win | window) [to] port <number_small>:
    user.i3wm_move_to_workspace(number_small)
move (win | window) [to] last port:
    user.i3wm_move_to_workspace("back_and_forth")


(win | window) kill: app.window_close()

(win | window) full: user.i3wm_fullscreen()

(win | window) resize: user.i3wm_mode("resize")

(win | window) grow [across]:
    user.i3wm_mode("resize")
    key(right:1)
    key(escape)

(win | window) shrink [across]:
    user.i3wm_mode("resize")
    key(left:1)
    key(escape)

(win | window) grow vert:
    user.i3wm_mode("resize")
    key(down:1)
    key(escape)

(win | window) shrink vert:
    user.i3wm_mode("resize")
    key(up:1)
    key(escape)

term vert:
    user.i3wm_split("h")
    user.i3wm_shell()

term across:
    user.i3wm_split("v")
    user.i3wm_shell()

# these rely on the user settings for the mod key. see i3wm.py Actions class
launch: user.i3wm_launch()

launch <user.text>:
    user.i3wm_launch()
    sleep(100ms)
    insert("{text}")

# this doesn't seem to actually work...
lock screen: user.i3wm_lock()

##### Commands below this line are ones I'm not sure about / inherited from community

# this got confused with "slapper"
# (port flip | flipper): user.i3wm_switch_to_workspace("back_and_forth")

# LEL 2025-05-14: this seems broken
# (shuffle | move) flipper: user.i3wm_move_to_workspace("back_and_forth")

(win | window) stacking: user.i3wm_layout("stacking")
(win | window) default: user.i3wm_layout()
(win | window) tabbed: user.i3wm_layout("tabbed")

reload i three config: user.i3wm_reload()
restart i three: user.i3wm_restart()

toggle floating: user.i3wm_float()
focus floating: user.i3wm_focus("mode_toggle")

center window: user.i3wm_move_position("center")
focus parent: user.i3wm_focus("parent")
focus child: user.i3wm_focus("child")

(win | window) horizontal: user.i3wm_split("h")
(win | window) vertical: user.i3wm_split("v")

make scratch: user.i3wm_move("scratchpad")
[(show | hide)] scratch: user.i3wm_show_scratchpad()
next scratch:
    user.i3wm_show_scratchpad()
    user.i3wm_show_scratchpad()

(launch shell | koopa): user.i3wm_shell()

new scratch (shell | window):
    user.i3wm_shell()
    sleep(200ms)
    user.i3wm_move("scratchpad")
    user.i3wm_show_scratchpad()

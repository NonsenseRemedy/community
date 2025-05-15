tag: user.bash
-

##########
# temporary until I do a full-featured tmux set

# terminal-based commands

mux: "tmux "

mux list sessions:
    "tmux list-sessions"
    key(enter)

mux attach session:
    "tmux attach-session -t "

# commands for within tmux

mux kill session:
    key(ctrl-b)
    key(:)
    "kill-session"

mux detach:
    key(ctrl-b)
    key(d)


mux (win | window) <number_small>:
    key(ctrl-b)
    key(:)
    "select-window -t:{number_small}"
    key(enter)
    # the below did not work for window numbers greater than 9
    # key(ctrl-b)
    # key('{number_small}')

mux (win | window) close:
    key(ctrl-b)
    key(&)

mux (win | window) new:
    key(ctrl-b)
    key(c)

mux (win | window) last:
    key(ctrl-b)
    key(p)
mux (win | window) next:
    key(ctrl-b)
    key(n)
mux (win | window) rename:
    key(ctrl-b)
    key(,)

mux (win | window) renumber:
    key(ctrl-b)
    key(:)
    "move-window -r"
    key(enter)

mux sessions:
    key(ctrl-b)
    key(s)
    key(+)

mux tree:
    key(ctrl-b)
    key(:)
    "choose-tree"
    key(enter)

# On hyenineI have set this to be turned on by default
# by adding a line to ~/.tmux.conf
mux mouse dog:
    key(ctrl-b)
    key(:)
    "set -g mouse"
    key(enter)

# matching the sense of the community split commands, where "vert"
# creates two columns.
mux split vert:
    key(ctrl-b)
    key(%)
mux split across:
    key(ctrl-b)
    key(")
mux pane next:
    key(ctrl-b)
    key(o)

mux pane show:
    key(ctrl-b)
    key(q)

mux pane <number_small>:
    key(ctrl-b)
    key(q)
    key('{number_small}')


mux move <user.arrow_key>:
    key(ctrl-b)
    key(arrow_key)

mux pane close:
    key(ctrl-b)
    key(x)


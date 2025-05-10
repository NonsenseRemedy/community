tag: user.bash
-

##########
# temporary until I do a full-featured tmux set

mux: "tmux "

mux list sessions:
    "tmux list-sessions"
    key(enter)

mux attach session:
    "tmux attach-session -t "

mux kill session:
    key(ctrl-b)
    key(:)
    "kill-session"

mux detach:
    key(ctrl-b)
    key(d)


mux win <number_small>:
    key(ctrl-b)
    key('{number_small}')

mux win close:
    key(ctrl-b)
    key(&)

mux win new:
    key(ctrl-b)
    key(c)

mux win last:
    key(ctrl-b)
    key(p)
mux win next:
    key(ctrl-b)
    key(n)
mux win rename:
    key(ctrl-b)
    key(,)

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
mux move <user.arrow_key>:
    key(ctrl-b)
    key(arrow_key)

mux pane close:
    key(ctrl-b)
    key(x)


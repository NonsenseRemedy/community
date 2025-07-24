tag: user.bash
-

##########
# temporary until I do a full-featured tmux set

# terminal-based commands

(mux | tmux): "tmux "

(mux | tmux) list sessions:
    "tmux list-sessions"
    key(enter)

(mux | tmux) attach session:
    "tmux attach-session -t "

# commands for within tmux

(mux | tmux) kill session:
    key(ctrl-b)
    key(:)
    "kill-session"

(mux | tmux) detach:
    key(ctrl-b)
    key(d)

(mux | tmux) (win | window) <number_small>:
    key(ctrl-b)
    key(:)
    "select-window -t:{number_small}"
    key(enter)
    # the below did not work for window numbers greater than 9
    # key(ctrl-b)
    # key('{number_small}')

(mux | tmux) (win | window) close:
    key(ctrl-b)
    key(&)

(mux | tmux) (win | window) new:
    key(ctrl-b)
    key(c)

(mux | tmux) (win | window) last:
    key(ctrl-b)
    key(p)
(mux | tmux) (win | window) next:
    key(ctrl-b)
    key(n)
(mux | tmux) (win | window) rename:
    key(ctrl-b)
    key(,)

(mux | tmux) (win | window) renumber:
    key(ctrl-b)
    key(:)
    "move-window -r"
    key(enter)

(mux | tmux) sessions:
    key(ctrl-b)
    key(s)
    key(+)

(mux | tmux) tree:
    key(ctrl-b)
    key(:)
    "choose-tree"
    key(enter)

# On hyenineI have set this to be turned on by default
# by adding a line to ~/.tmux.conf
(mux | tmux) mouse dog:
    key(ctrl-b)
    key(:)
    "set -g mouse"
    key(enter)

# matching the sense of the community split commands, where "vert"
# creates two columns.
(mux | tmux) split vert:
    key(ctrl-b)
    key(%)
(mux | tmux) split across:
    key(ctrl-b)
    key(")
(mux | tmux) pane next:
    key(ctrl-b)
    key(o)

(mux | tmux) pane show:
    key(ctrl-b)
    key(q)

(mux | tmux) pane <number_small>:
    key(ctrl-b)
    key(q)
    key('{number_small}')

(mux | tmux) move <user.arrow_key>:
    key(ctrl-b)
    key(arrow_key)

(mux | tmux) pane close:
    key(ctrl-b)
    key(x)

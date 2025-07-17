tag: user.bash
-

uv init:
    "uv init "

uv pip list:
    "uv pip list"
    key(enter)

uv venv:
    "uv venv "

uv activate:
    "source .venv/bin/activate"
    key(enter)

uv add:
    "uv add "

uv add <user.prose>$:
    "uv add {prose} "

uv remove:
    "uv remove "
uv remove <user.prose>$:
    "uv remove {prose} "

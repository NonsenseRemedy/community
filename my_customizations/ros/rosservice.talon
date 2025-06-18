tag: terminal
-

rosservice call:
    "rosservice call "

rosservice call (this | that):
    text = edit.selected_text()
    "rosservice call {text} "

rosservice list:
    "rosservice list "

rosservice list grep <user.text>:
    insert('rosservice list | grep -i "{user.text}"')

rosservice list grep:
    insert('rosservice list | grep -i ""')
    key(left:1)

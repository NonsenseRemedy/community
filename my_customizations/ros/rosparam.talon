tag: terminal
-
rosparam get:
    "rosparam get "

rosparam get (this | that):
    text = edit.selected_text()
    "rosparam get {text} "

rosparam list:
    "rosparam list "

rosparam list grep <user.text>:
    insert('rosparam list | grep -i "{user.text}"')

rosparam list grep:
    insert('rosparam list | grep -i ""')
    key(left:1)

app: chrome
-

tag(): browser
tag(): user.tabs

# for some reason, this results in text being inserted twice in gmail drafts,
# so disable it in this context
settings():
    user.paste_to_insert_threshold = -1


profile switch: user.chrome_mod("shift-m")

tab search: user.chrome_mod("shift-a")

tab search <user.text>$:
    user.chrome_mod("shift-a")
    sleep(200ms)
    insert("{text}")
    key(down)

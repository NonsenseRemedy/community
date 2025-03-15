tag: terminal
-

# NYI rostopic commands: pub

# The next time I do this,  I think I will follow the example in git.talon better and do one omnibus file of options across all related tools,  rather than trying to make sure that they only  produced valid commands.  I also think I should have produced a separate list of  rostopic sub commands and parametrized the rules that way as well.

#############################################
#############################################
# ROSTOPIC BW

rostopic bandwidth help:
    "rostopic bw --help"
    key(enter)

rostopic bandwidth [window <number_small>]:
    window = ""
    if number_small or false: window = " -w {number_small} "
    "rostopic bw {window}"

rostopic bandwidth [window <number_small>] (this | that):
    window = ""
    if number_small or false: window = " -w {number_small} "
    text = edit.selected_text()
    "rostopic bw{window} {text}"
    key(enter)

rostopic bandwidth [window <number_small>] paste:
    window = ""
    text = edit.selected_text()
    "rostopic bw{window} {clip.text()}"
    key(enter)


#############################################
#############################################
# ROSTOPIC DELAY

rostopic delay [window <number_small>] [<user.rostopic_delay_args>]:
    window = ""
    if number_small or false: window = " -w {number_small} "
    args = rostopic_delay_args or ""
    "rostopic delay {window}{args}"

rostopic delay [window <number_small>] [<user.rostopic_delay_args>] (this | that):
    window = ""
    if number_small or false: window = " -w {number_small} "
    args = rostopic_delay_args or ""
    text = edit.selected_text()
    "rostopic delay{window}{args} {text}"
    key(enter)

rostopic delay [window <number_small>] [<user.rostopic_delay_args>] paste:
    window = ""
    if number_small or false: window = " -w {number_small} "
    args = rostopic_delay_args or ""
    "rostopic delay{window}{args} {clip.text()}"
    key(enter)



#############################################
#############################################
# ROSTOPIC ECHO
#
# * -w (fixed width) : NYI since I couldn't figure out how to enforce
#          the numeric argument
# * --bag: needs to be the last one said, but this is not enforced
#          programmatically.
# * -n: count needs to be the first argument, since we handle it separately
#          (I could not figure out how to mix arguments with and without values)

rostopic echo [count <number_small>] [<user.rostopic_echo_args>]:
    count = ""
    if number_small or false: count = " -n {number_small} "
    args = rostopic_echo_args or ""
    "rostopic echo{count}{args}"

    # I'm trying to figure out how to make it not care where this command goes,
    # but I can't figure out how to get it to match two capture groups optionally
    # cmd = "rostopic echo "
    # if number_small_1 or false: cmd += " -n {number_small_1} "
    # if number_small_2 or false: cmd += " -n {number_small_2} "
    # args = rostopic_echo_args or ""
    # cmd += args
    # insert("{cmd}")

rostopic echo [count <number_small>] [<user.rostopic_echo_args>] (this | that):
    count = ""
    if number_small or false: count = " -n {number_small} "
    args = rostopic_echo_args or ""
    text = edit.selected_text()
    "rostopic echo{count}{args} {text}"
    key(enter)

rostopic echo [count <number_small>] [<user.rostopic_echo_args>] paste:
    count = ""
    if number_small or false: count = " -n {number_small} "
    args = rostopic_echo_args or ""
    "rostopic echo{count}{args} {clip.text()}"
    key(enter)


#############################################
#############################################
# ROSTOPIC FIND

rostopic find:
    "rostopic find "

rostopic find help:
    "rostopic find --help"
    key(enter)

rostopic find (this | that):
    text = edit.selected_text()
    "rostopic find {text}"
    key(enter)

rostopic find paste:
    "rostopic find {clip.text()}"
    key(enter)


#############################################
#############################################
# ROSTOPIC HERTZ
#
# --window: needs to be said first, since options with arguments are handled differently
# --filter: needs to be said last, since we don't support inserting the filter expression

rostopic hertz [window <number_small>] [<user.rostopic_hz_args>]:
    window = ""
    if number_small or false: window = " -w {number_small} "
    args = rostopic_hz_args or ""
    "rostopic hz {window}{args}"

rostopic hertz [window <number_small>] [<user.rostopic_hz_args>] (this | that):
    window = ""
    if number_small or false: window = " -w {number_small} "
    args = rostopic_hz_args or ""
    text = edit.selected_text()
    "rostopic hz {window}{args} {text}"
    key(enter)

rostopic hertz [window <number_small>] [<user.rostopic_hz_args>] paste:
    window = ""
    if number_small or false: window = " -w {number_small} "
    args = rostopic_hz_args or ""
    "rostopic hz {window}{args} {clip.text()}"
    key(enter)

#############################################
#############################################
# ROSTOPIC INFO
#
# rostopic info doesn't have many options, so no need to use talon lists

rostopic info:
    "rostopic info "

rostopic info help:
    "rostopic info --help"
    key(enter)

rostopic info (this | that):
    text = edit.selected_text()
    "rostopic info {text}"
    key(enter)

rostopic info paste:
    "rostopic info {clip.text()}"
    key(enter)

#############################################
#############################################
# ROSTOPIC LIST

rostopic list [<user.rostopic_list_args>]:
    args = rostopic_list_args or ""
    "rostopic list{args}"
    key(enter)

rostopic list [<user.rostopic_list_args>] grep <user.text>:
    args = rostopic_list_args or ""
    insert('rostopic list{args} | grep -i "{user.text}"')

#############################################
#############################################
# ROSTOPIC PUB
#
# Given how much editing has to happen to fill out the fields in a message,  I'm wondering whether this would be better to do an an ipython notebook,  so I could use cursorless to edit it.

rostopic pub [rate <number_small>] [<user.rostopic_pub_args>]:
    rate = ""
    if number_small or false: rate = " -r {number_small} "
    args = rostopic_pub_args or ""
    "rostopic pub {rate}{args}"

rostopic pub [rate <number_small>] [<user.rostopic_pub_args>] (this | that):
    rate = ""
    if number_small or false: rate = " -r {number_small} "
    args = rostopic_pub_args or ""
    text = edit.selected_text()
    "rostopic pub{rate}{args} {text} "

rostopic pub [rate <number_small>] [<user.rostopic_pub_args>] paste:
    rate = ""
    if number_small or false: rate = " -r {number_small} "
    args = rostopic_pub_args or ""
    "rostopic pub{rate}{args} {clip.text()} "



#############################################
#############################################
# ROSTOPIC TYPE

rostopic type:
    "rostopic type "

rostopic type help:
    "rostopic type --help"
    key(enter)

rostopic type (this | that):
    text = edit.selected_text()
    "rostopic type {text}"
    key(enter)

rostopic type paste:
    "rostopic type {clip.text()}"
    key(enter)
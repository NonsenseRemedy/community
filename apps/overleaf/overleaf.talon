title: /Overleaf/i
tag: browser

-

# Really, these are latex snippets hackily done to work in a website

# TODO: should this be a talon list of latex commands? (section, subsection, etc...)

new section:
    insert("\\section{}")
    key(left)

new subsection:
    insert("\\subsection{}")
    key(left)

# text formatting

text bold:
    insert("\\textbf{}")
    key(left)

text mono:
    insert("\\texttt{}")
    key(left)

# itemize commands; super hacky because I could not directly insert text
# containing "{itemize}" thanks to f-string interpretation
begin itemize:
    insert("\\begin{}")
    key(left)
    insert("itemize")
    key(right enter enter)
    insert("\\end{}")
    key(left)
    insert("itemize")
    key(up)
    insert("\\item ")

new item:
    edit.line_insert_down()
    insert("\\item ")


###############
# overleaf keyboard shortcuts
#
# (TODO: this may need to made operating system specific)
###############

comment that:
    key(cmd-/)

indent that:
    key(tab)

dedent that:
    key(shift-tab)


go to line:
    key(cmd-shift-l)

# # I can't get this to work...
# go to line <user.number>:
    # key(cmd-shift-l)
    # sleep(100ms)
    # insert("{number}")
    # sleep(200ms)
    # key(enter)

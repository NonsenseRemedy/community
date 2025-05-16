tag: terminal
and tag: user.git
-

git {user.git_command} [<user.git_arguments>]:
    args = git_arguments or ""
    insert("git {git_command}{args} ")
git commit [<user.git_arguments>] message [<user.prose>]:
    args = git_arguments or ""
    message = prose or ""
    user.insert_between('git commit{args} --message "{message}', '"')
git stash [push] [<user.git_arguments>] message [<user.prose>]:
    args = git_arguments or ""
    message = prose or ""
    user.insert_between('git stash push{args} --message "{message}', '"')

# Optimistic execution for frequently used commands that are harmless (don't
# change repository or index state).
git status$:
    "git status"
    key(enter)
git add patch$:
    "git add --patch"
    key(enter)
git show head$:
    "git show HEAD"
    key(enter)
# LEL: don't press enter automatically so we can specify files as desired
git diff$:
    "git diff "
git diff all$:
    "git diff"
    key(enter)
git diff (cached | cashed)$:
    "git diff --cached"
    key(enter)
git log$:
    "git log --graph -300 --all --color --oneline --decorate"
    key(enter)
git log long$:
    "git log"
    key(enter)

# Convenience
git clone (this | that):
    insert("git clone ")
    edit.paste()
    key(enter)

git clone paste:
    edit.copy()
    insert("git clone ")
    edit.paste()
    key(enter)

git diff highlighted:
    edit.copy()
    insert("git diff ")
    edit.paste()
    key(enter)
git diff clipboard:
    insert("git diff ")
    edit.paste()
    key(enter)
git add highlighted:
    edit.copy()
    insert("git add ")
    edit.paste()
    key(enter)
git add clipboard:
    insert("git add ")
    edit.paste()
    key(enter)
git commit highlighted:
    edit.copy()
    insert("git add ")
    edit.paste()
    insert("\ngit commit\n")

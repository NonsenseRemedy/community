tag: user.bash
-

# Install jj in a docker container
JJ install docker:
    "wget https://github.com/jj-vcs/jj/releases/download/v0.32.0/jj-v0.32.0-x86_64-unknown-linux-musl.tar.gz"
    key(enter)
    "tar -xzvf jj-v0.32.0-x86_64-unknown-linux-musl.tar.gz"
    key(enter)
    "cp jj /bin/"
    key(enter)
    "jj config set --user user.email \"lindzey@uw.edu\""
    key(enter)
    "jj config set --user user.name \"Laura Lindzey\""
    key(enter)
    "jj config set --user ui.pager more"
    key(enter)
    "jj config set --user ui.editor \"code -w\""
    key(enter)

JJ git init colocate:
    "jj git init --colocate"

JJ log all:
    "jj log -r ::"
    key(enter)

JJ push origin:
    "jj git push --allow-new --remote origin --bookmark "

JJ push origin <user.prose>:
    "jj git push --allow-new --remote origiplay, trapn --bookmark {prose}"

JJ split:
    "jj split"

JJ new:
    "jj new"

JJ show:
    "jj show "

#############

JJ:
    "jj "

JJ config edit user:
    "jj config edit --user"
    key(enter)

# Since I can't get the lists to work right now, trying with just the common commands
JJ bookmark set:
    "jj bookmark set "

JJ bookmark set <user.prose>:
    "jj bookmark set {prose}"

JJ git fetch:
    "jj git fetch"
    key(enter)

# jj {user.jj_command} [user.jj_argument]:
#     args = jj_argument or ""
#     "jj {jj_command}{args} "

jj {user.jj_command}:
    "jj {jj_command} "

# These are the only two times I'd call jj without a command
JJ help:
    "jj --help"
    key(enter)

JJ version:
    "jj --version"
    key(enter)

# Safe ones we'll want to run with "enter"
JJ log:
    "jj log"
    key(enter)

# The "describe" command is pretty basic -- I think I'll wind up wanting argument lists for most of them.

JJ describe:
    "jj describe"

JJ describe help:
    "jj describe --help"
    key(enter)

JJ describe message:
    "jj describe --message \"\""
    key(left)

JJ describe message <user.prose>:
    user.insert_between('jj describe --message "{prose}"')

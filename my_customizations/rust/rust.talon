tag: user.bash
-

cargo new:
    "cargo new "

cargo new <user.prose>$:
    "cargo new {prose}"

cargo new <user.letters>$:
    "cargo new {letters}"

cargo install:
    "cargo install "

cargo install <user.prose>$:
    "cargo install {prose}"

cargo install <user.letters>$:
    "cargo install {letters}"

cargo dock open:
    "cargo doc --open"
    key(enter)

############

cargo build:
    "cargo build "
    key(enter)

cargo run:
    "cargo run "
    key(enter)

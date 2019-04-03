## loading functions
source ~/.config/fish/functions/*.fish
source /usr/share/doc/pkgfile/command-not-found.fish
blurk
# tmux_init
# welcome

## hidpi
# set -gx QT_SCREEN_SCALE_FACTORS 1
# set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1

## ksshaskpass
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
set -gx SSH_ASKPASS "/usr/bin/ksshaskpass"
set -gx SUDO_ASKPASS "/usr/bin/ksshaskpass"

## gpg-agent
# set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"

## rust
# set -gx RUSTUP_DIST_SERVER https://mirrors.sjtug.sjtu.edu.cn/rust-static
# set -gx RUSTUP_UPDATE_ROOT https://mirrors.sjtug.sjtu.edu.cn/rust-static/rustup
set -gx RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -gx RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup

## PATH
#set -gx PATH "~/.cargo/bin:~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin:~/go/bin"

## golang
set -gx GOPATH ~/go
set -gx HTTP_PROXY http://127.0.0.1:9995

## loading functions
source ~/.config/fish/functions/*.fish
source /usr/share/doc/pkgfile/command-not-found.fish
blurk
# tmux_init
# welcome

# hidpi
# set -gx QT_SCREEN_SCALE_FACTORS 1
# set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1

# ksshaskpass
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
set -gx SSH_ASKPASS "/usr/bin/ksshaskpass"
set -gx SUDO_ASKPASS "/usr/bin/ksshaskpass"

# rust
set -gx RUSTUP_DIST_SERVER https://mirrors.sjtug.sjtu.edu.cn/rust-static
set -gx RUSTUP_UPDATE_ROOT https://mirrors.sjtug.sjtu.edu.cn/rust-static/rustup
# set -gx RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
# set -gx RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup

# PATH
set -gx PATH "$HOME/.pyenv/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin:$HOME/go/bin:/usr/lib/ccache/bin/:$PATH"

# pyenv
status --is-interactive; and source (pyenv init -|psub)

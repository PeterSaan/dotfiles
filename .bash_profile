#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$TMUX" ] && uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export BUN_BIN="$HOME/.bun/bin"
export GO_BIN="$HOME/go/bin"
export MASON_BIN="$HOME/.local/share/nvim/mason/bin"
export COMPOSER_BIN="$HOME/.config/composer/vendor/bin"
export PATH="$BUN_BIN:$GO_BIN:$MASON_BIN:$COMPOSER_BIN:$PATH"

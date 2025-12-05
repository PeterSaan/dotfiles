#
# ~/.bash_profile
#

[[ -f $HOME/.bashrc ]] && . $HOME/.bashrc

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_PICTURES_DIR="$HOME/Pictures"
export EDITOR="nvim"
export BUN_BIN="$HOME/.bun/bin"
export GO_BIN="$HOME/go/bin"
export MASON_BIN="$HOME/.local/share/nvim/mason/bin"
export COMPOSER_BIN="$HOME/.config/composer/vendor/bin"
export PATH="$BUN_BIN:$GO_BIN:$MASON_BIN:$COMPOSER_BIN:$PATH"

source $HOME/dotfiles/custom/scripts/battery-check.sh

#!/usr/bin/env bash

# shellcheck extended-analysis=false

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias l='ls -CF --color=auto'
alias la='ls -AF --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias g++='g++ -std=c++23'

PS1='[\u@\h \W]\$ '

prog()
{
	cd "$HOME/proge/"
}

gpgCat()
{
	gpg "$1"
	echo -e "\nContents of the file:\n"
	cat "$2"
	rm -rf "$2"
}

devClinker()
{
	if [[ $PWD != *"linker/backend" ]]; then
		echo "Please use this cmd in the project's backend directory"
		return 2
	fi
	rm -rf ~/go/bin/clinker
	go build ./cmd/cli/clinker.go
	mv clinker ~/go/bin/
}

battery()
{
	local i=0
	for bat in /sys/class/power_supply/BAT*; do
		echo "BAT$i: $(< $bat/capacity)%, $(< $bat/status)"
		((i++))
	done
}

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export BUN_BIN="$HOME/.bun/bin"
export GO_BIN="$HOME/go/bin"
export MASON_BIN="$HOME/.local/share/nvim/mason/bin"
if [[ $PATH != "$BUN_BIN:$GO_BIN:MASON_BIN:$PATH" ]]; then
	export PATH="$BUN_BIN:$GO_BIN:$MASON_BIN:$PATH"
fi

source /usr/share/nvm/init-nvm.sh
source /usr/share/bash-completion/completions/git

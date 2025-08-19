#!/usr/bin/env bash

# shellcheck extended-analysis=false

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias l='ls -CF --color=auto'
alias la='ls -AF --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias btpause='echo -e "menu player\npause\n" | bluetoothctl'
alias btplay='echo -e "menu player\nplay\n" | bluetoothctl'
alias btnext='echo -e "menu player\nnext\n" | bluetoothctl'
alias btprev='echo -e "menu player\nprevious\n" | bluetoothctl'

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

source /usr/share/nvm/init-nvm.sh
source /usr/share/bash-completion/completions/git

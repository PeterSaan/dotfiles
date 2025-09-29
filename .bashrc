#!/usr/bin/env bash

# shellcheck extended-analysis=false

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias btinfo='echo -e "menu player\nshow\n" | bluetoothctl'
alias btnext='echo -e "menu player\nnext\n" | bluetoothctl'
alias btpause='echo -e "menu player\npause\n" | bluetoothctl'
alias btplay='echo -e "menu player\nplay\n" | bluetoothctl'
alias btprev='echo -e "menu player\nprevious\n" | bluetoothctl'
alias esp-dev='source /opt/esp-idf/export.sh'
alias grep='grep --color=auto'
alias l='ls -CF --color=auto'
alias la='ls -AF --color=auto'
alias prog='cd $HOME/proge/'
alias vim='nvim'
alias yay='yay --aur'

PS1='[\u@\h \W]\$ '


battery() {
	local i=0
	for bat in /sys/class/power_supply/BAT*; do
		echo "BAT$i: $(< $bat/capacity)%, $(< $bat/status)"
		((i++))
	done
}


source /usr/share/nvm/init-nvm.sh
source /usr/share/bash-completion/completions/git

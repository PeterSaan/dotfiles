#!/usr/bin/env bash

# shellcheck extended-analysis=false

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias btinfo='echo -e "menu player\nshow\n" | bluetoothctl'
alias btnext='echo -e "menu player\nnext\n" | bluetoothctl && sleep .5 ; btinfo'
alias btpause='echo -e "menu player\npause\n" | bluetoothctl'
alias btplay='echo -e "menu player\nplay\n" | bluetoothctl'
alias btprev='echo -e "menu player\nprevious\n" | bluetoothctl'
alias esp-dev='source /opt/esp-idf/export.sh'
alias grep='grep --color=auto'
alias l='ls -CF --color=auto'
alias la='ls -AF --color=auto'
alias pint='sh $([ -f pint ] && echo pint || echo vendor/bin/pint)'
alias prog='cd $HOME/proge/'
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
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

fastmaria() {
	if [[ $# != 2 ]] then
		echo "fastmaria requires 2 paramaters: container name and db name"
		return 1
	fi

	local container_name=$1
	local db_name=$2

	docker container stop "$container_name"
	local exit_code=$?

	if [[ $exit_code == 0 ]] then
		docker container remove "$container_name"
	fi

	docker run --detach --name "$container_name" -p 3306:3306 --env MARIADB_USER=user \
		--env MARIADB_PASSWORD=user --env MARIADB_DATABASE="$db_name" \
		--env MARIADB_ROOT_PASSWORD=my-secret-pw mariadb:11.8

	echo "MariaDB 11.8.* container $container_name, table $db_name, user user, pass user"
	return $?
}

source /usr/share/nvm/init-nvm.sh
source /usr/share/bash-completion/completions/git

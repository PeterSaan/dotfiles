#!/usr/bin/env bash

ping -c 1 vpn.saanikas.com >/dev/null 2>&1
RET=$?

if [[ $RET != 0 ]] then
	echo -e '{"text":"Domain down","class":"down"}' | jq --unbuffered --compact-output
	exit
fi

echo -e '{"text":"Domain up"}' | jq --unbuffered --compact-output

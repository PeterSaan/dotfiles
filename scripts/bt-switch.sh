#!/usr/bin/env bash

echo -e "menu mgmt\ninfo\n" | bluetoothctl | grep current | grep powered >/dev/null 2>&1
RETURN_CODE=$?

if [[ $RETURN_CODE -eq 0 ]] then
	echo "power off" | bluetoothctl >/dev/null 2>&1
	exit
fi

echo "power on" | bluetoothctl >/dev/null 2>&1

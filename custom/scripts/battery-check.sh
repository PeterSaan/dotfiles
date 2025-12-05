#!/usr/bin/env bash

BATCOUNT=`ls -a /sys/class/power_supply | grep BAT | wc -l`

[[ $BATCOUNT != 0 ]] && export BATTERIES="$BATCOUNT"
unset BATCOUNT

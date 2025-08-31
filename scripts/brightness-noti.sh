#!/usr/bin/env bash

type bc >/dev/null 2>&1 || {
	notify-send -a brightness-noti \
		"Brightness change" \
		"I require bc for floating point arithmetic but it's not installed.";
	exit 1;
}

BRIGHTNESS_DIR="/sys/class/backlight/intel_backlight"
MAX_BRIGHTNESS=$(< $BRIGHTNESS_DIR/max_brightness)
BRIGHTNESS_NOW=$(< $BRIGHTNESS_DIR/brightness)

PERCENTAGE=$(bc <<< "scale=3; $BRIGHTNESS_NOW/$MAX_BRIGHTNESS*100")
RESULT=$(printf '%.*f\n' 0 $PERCENTAGE)%

notify-send -a brightness-noti "Brightness change" $RESULT

if systemctl --user is-active --quiet waybar; then
	systemctl --user stop --now waybar
	exit
fi

systemctl --user start --now waybar

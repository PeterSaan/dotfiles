#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$TMUX" ] && uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi

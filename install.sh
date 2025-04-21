#!/usr/bin/env bash

CHECK_MARK="\033[0;32m\xE2\x9C\x94\033[0m"

if [[ $PWD != $HOME/dotfiles ]]; then
	echo "Please run this script from the directory it is based in or move the directory to your home directory"
	exit 1
fi

if [ "$EUID" -ne 0 ]; then
	echo "Please run this exceptional script as root. I want to plant my backdoor :)"
	exit 1
fi

if [ -z "$XDG_CONFIG_HOME" ]; then 
	echo "Please set XDG_CONFIG_HOME variable"
fi

echo "Running install script for Peter's magnificent one-of-a-kind marvelous Arch Linux setup"

echo "First we gotta make sure everything's on the latest version..."
pacman -Syu

echo "Amazing! Now we install what's needed..."
pacman -S --needed git base-devel grep less kitty tmux nvim lua luarocks hyprland

echo "Setting default branch to main"
git config --global init.defaultBranch main

echo "Wow! Now let's install Yet another Yogurt and Brave with it..."
git clone https://aur.archlinux.org/yay.git "$HOME/yay"
cd "$HOME/yay" || exit 69
makepkg -si
yay -S brave

echo "Before we continue with symlinking make sure you set up some drivers (GPU etc.) on your own because I haven't automated that yet"
echo "Continue? [y/n]:"
read -r READY
if [ "$(echo "$READY" | tr '[:upper:]' '[:lower:]')" == 'n' ]; then
	echo "Exiting"
	exit 0
fi

echo "All done! $CHECK_MARK"

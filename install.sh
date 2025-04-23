#!/usr/bin/env bash

CHECK_MARK="\033[0;32m\xE2\x9C\x94\033[0m"

if [[ $PWD != "$HOME/dotfiles" ]]; then
	echo "Please run this exceptional script from the directory it is based in or move the directory to your home directory"
	exit 1
fi

if [ -z "$XDG_CONFIG_HOME" ]; then 
	echo "Please set XDG_CONFIG_HOME variable"
	exit 1
fi

echo "Want to run install script for Peter's magnificent one-of-a-kind marvelous Arch Linux setup? [y/n]:"
read READY
if [ "$(echo "$READY" | tr '[:upper:]' '[:lower:]')" == 'n' ]; then
	echo "Exiting"
	exit 0
fi

echo "Continue with installing? [y/n]:"
read READY
if [ "$(echo "$READY" | tr '[:upper:]' '[:lower:]')" == 'n' ]; then
	echo "Exiting"
	exit 0
fi

echo "First we gotta make sure everything's on the latest version..."
sudo pacman -Syu

echo "Amazing! Now we install what's needed with pacman..."
sudo pacman -S --needed git base-devel grep less \
	kitty tmux nvim lua luarocks nvm go \
	hyprland mako pipewire wireplumber xdg-desktop-portal-hyprland xdg-desktop-portal-gtk qt5-wayland qt6-wayland hyprpolkitagent

echo "Setting Git's default branch to main"
git config --global init.defaultBranch main

echo "Installing latest Node.js and NPM versions with NVM..."
nvm install node

echo "Incredible! Now let's install Yet another Yogurt..."
git clone https://aur.archlinux.org/yay.git "$HOME/yay"
cd "$HOME/yay" || exit 69
makepkg -si

echo "And some AUR packages with it..."
yay -S brave

echo "That's it. All done! $CHECK_MARK"

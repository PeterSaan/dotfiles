#!/usr/bin/env bash

GREEN="\033[0;32m"
RESET_TXT="\033[0m"
CHECK_MARK="\033[0;32m\xE2\x9C\x94\033[0m"

if [[ $PWD != "$HOME/dotfiles" ]]; then
	echo "Please run this exceptional script from the directory it's based in or move the directory to your \$HOME."
	exit 1
fi

if [ -z "$XDG_CONFIG_HOME" ]; then 
	echo "Couldn't find XDG_CONFIG_HOME env variable. Make sure it's set."
	exit 1
fi

echo "Running setup script for Peter's magnificent one-of-a-kind marvelous Arch Linux setup"
echo "Ready? [Y/n]:"
read READY
if [ "$(echo "$READY" | tr '[:upper:]' '[:lower:]')" == 'n' ]; then
	echo "Exiting..."
	exit 0
fi

echo "Copypasting and symlinking..."

rm -rf $XDG_CONFIG_HOME/hypr
rm -rf $XDG_CONFIG_HOME/kitty
rm -rf $XDG_CONFIG_HOME/mako
rm -rf $XDG_CONFIG_HOME/neofetch
rm -rf $XDG_CONFIG_HOME/nvim
rm -rf $XDG_CONFIG_HOME/rofi
rm -rf $XDG_CONFIG_HOME/tmux
rm -rf $XDG_CONFIG_HOME/uwsm
rm -rf $XDG_CONFIG_HOME/waybar
rm -rf $XDG_CONFIG_HOME/wireplumber
rm -rf $XDG_CONFIG_HOME/xdg-desktop-portal
rm -rf $HOME/.bash_profile
rm -rf $HOME/.bashrc
sudo rm /etc/sddm.conf

ln -s $HOME/dotfiles/hypr $XDG_CONFIG_HOME/hypr
ln -s $HOME/dotfiles/kitty $XDG_CONFIG_HOME/kitty
ln -s $HOME/dotfiles/mako $XDG_CONFIG_HOME/mako
ln -s $HOME/dotfiles/neofetch $XDG_CONFIG_HOME/neofetch
ln -s $HOME/dotfiles/nvim $XDG_CONFIG_HOME/nvim
ln -s $HOME/dotfiles/rofi $XDG_CONFIG_HOME/rofi
ln -s $HOME/dotfiles/tmux $XDG_CONFIG_HOME/tmux
ln -s $HOME/dotfiles/uwsm $XDG_CONFIG_HOME/uwsm
ln -s $HOME/dotfiles/waybar $XDG_CONFIG_HOME/waybar
ln -s $HOME/dotfiles/wireplumber $XDG_CONFIG_HOME/wireplumber
ln -s $HOME/dotfiles/xdg-desktop-portal $XDG_CONFIG_HOME/xdg-desktop-portal
ln -s $HOME/dotfiles/.bash_profile $HOME/.bash_profile
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
sudo ln -s $HOME/dotfiles/sddm/sddm.conf /etc/sddm.conf
sudo cp --update=all -i $HOME/dotfiles/sddm/hyprland.conf /usr/lib/sddm/sddm.conf.d/hyprland.conf

echo "Done!"
echo "Exit with installing? [Y/n]:"
read READY
if [ "$(echo "$READY" | tr '[:upper:]' '[:lower:]')" == 'n' ]; then
	echo "Exiting"
	exit 0
fi

echo "First we gotta make sure everything's on the latest version..."
sudo pacman -Syu

echo "Amazing! Now we install what's needed with pacman..."
sudo pacman -S --needed git base-devel grep less kitty tmux nvim lua luarocks \
	nvm go hyprland mako sof-firmware pipewire pipewire-audio wireplumber sddm \
	hyprlock hypridle xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
	qt5-wayland qt6-wayland networkmanager hyprpolkitagent uwsm hyprpaper \
	wget docker docker-compose unzip btop rofi brightnessctl waybar otf-font-awesome \
	firewalld grim slurp


echo "Change Git's default branch to main? [y/N]:"
read OPTIONAL
if [ "$(echo "$OPTIONAL" | tr '[:upper:]' '[:lower:]')" == 'y' ]; then
	git config --global init.defaultBranch main
fi

echo "Install Node and NPM with NVM? [y/N]"
read OPTIONAL
if [ "$(echo "$OPTIONAL" | tr '[:upper:]' '[:lower:]')" == 'y' ]; then
	nvm install node --latest-npm
fi

echo "Install YAY? [y/N]"
read OPTIONAL
if [ "$(echo "$OPTIONAL" | tr '[:upper:]' '[:lower:]')" == 'y' ]; then
	git clone https://aur.archlinux.org/yay.git "$HOME/yay"
	cd "$HOME/yay" || exit 69
	makepkg -si
fi

echo "Install AUR packages with YAY? [y/N]"
read OPTIONAL
if [ "$(echo "$OPTIONAL" | tr '[:upper:]' '[:lower:]')" == 'y' ]; then
	yay -S brave vesktop
fi

echo "Install Bun? [y/N]"
read OPTIONAL
if [ "$(echo "$OPTIONAL" | tr '[:upper:]' '[:lower:]')" == 'y' ]; then
	curl -fsSL https://bun.sh/install | bash
fi

echo "Done!"
echo "Continue enabling services/sockets? [Y/n]:"
read READY
if [ "$(echo "$READY" | tr '[:upper:]' '[:lower:]')" == 'n' ]; then
	echo "Exiting"
	exit 0
fi

systemctl enable NetworkManager
systemctl enable sddm
systemctl --user enable hypridle
systemctl --user enable hyprpolkitagent
systemctl --user enable waybar
systemctl enable docker.socket

echo -e "That's it. All done! ${CHECK_MARK}"

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
echo "This will delete the config directories that you already have (the ones defined in this directory)"
echo "Then it will create symlinks to these directories"
echo "After which it will prompt you to move on to the next part (package installing and service activations)"
echo "Ready? [y/n]:"
read READY
if [ "$(echo "$READY" | tr '[:upper:]' '[:lower:]')" == 'n' ]; then
	echo "Exiting..."
	exit 0
fi

echo "Creating symlinks..."

rm -rf $XDG_CONFIG_HOME/hypr*
rm -rf $XDG_CONFIG_HOME/kitty*
rm -rf $XDG_CONFIG_HOME/neofetch*
rm -rf $XDG_CONFIG_HOME/nvim*
rm -rf $XDG_CONFIG_HOME/rofi*
rm -rf $XDG_CONFIG_HOME/tmux*
rm -rf $XDG_CONFIG_HOME/uwsm*
rm -rf $XDG_CONFIG_HOME/waybar*
rm -rf $XDG_CONFIG_HOME/xdg-desktop-portal*
rm -rf $HOME/.bash_profile
rm -rf $HOME/.bashrc

ln -s $HOME/dotfiles/hypr $XDG_CONFIG_HOME/hypr
ln -s $HOME/dotfiles/kitty $XDG_CONFIG_HOME/kitty
ln -s $HOME/dotfiles/neofetch $XDG_CONFIG_HOME/neofetch
ln -s $HOME/dotfiles/nvim $XDG_CONFIG_HOME/nvim
ln -s $HOME/dotfiles/rofi $XDG_CONFIG_HOME/rofi
ln -s $HOME/dotfiles/tmux $XDG_CONFIG_HOME/tmux
ln -s $HOME/dotfiles/uwsm $XDG_CONFIG_HOME/uwsm
ln -s $HOME/dotfiles/waybar $XDG_CONFIG_HOME/waybar
ln -s $HOME/dotfiles/xdg-desktop-portal $XDG_CONFIG_HOME/xdg-desktop-portal
ln -s $HOME/dotfiles/.bash_profile $HOME/.bash_profile
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc

echo "Done!"
echo "Continue with installing? [y/n]:"
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


echo "Setting Git's default branch to main"
git config --global init.defaultBranch main

echo "Installing latest Node.js and NPM versions with NVM..."
nvm install node --latest-npm

echo "Incredible! Now let's install Yet another Yogurt..."
git clone https://aur.archlinux.org/yay.git "$HOME/yay"
cd "$HOME/yay" || exit 69
makepkg -si

echo "And some AUR packages with it..."
yay -S brave vesktop

echo "And Bun too..."
curl -fsSL https://bun.sh/install | bash

echo "Done!"
echo "Continue enabling services/sockets? [y/n]:"
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

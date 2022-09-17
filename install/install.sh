#!/usr/bin/env bash

echo "Welcome to my Post Installation Script for Arch Linux and Arch Linux based distros"

cd ~/

echo "Copying my awesomewm config"
cp -r ~/dotfiles/awesome ~/.config
echo "Copying my .bashrc"
cp -r ~/dotfiles/bash/.bashrc ~/
echo "Copying my FISH config"
cp -r ~/dotfiles/fish ~/.config
echo "Copying my Alacritty config"
cp -r ~/dotfiles/alacritty ~/.config
echo "Copying my Doom Emacs config" 
cp -r ~/dotfiles/.doom.d ~/
echo "Copying my .zshrc"
cp -r ~/dotfiles/zsh/.zshrc ~/
echo "Copying my btop config"
cp -r ~/dotfiles/btop ~/.config/
echo "Copying my Neofetch config"
cp -r ~/dotfiles/neofetch/ ~/.config/

#echo "updating"
#sudo pacman -Syu

sleep 2

#Check if yay is installed 
#echo "pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
#If it is than

#yay -S awesome dmenu picom brave-bin librewolf-bin starship exa btop pfetch pokemon-colorscripts-git emacs nemo alacritty zsh alacritty-themes lxappearance nitrogen fish neovim ripgrep fd chromium
echo "Installing Packages from the Core Repos"
sudo pacman -S awesome dmenu picom starship exa btop lxappearance emacs alacritty zsh nitrogen fish neovim ripgrep fd chromium neofetch speedtest-cli

echo "Installing the Paru AUR helper"
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
sleep 3

#try to install aur packages
echo "Trying to Install AUR Packages"
paru -S brave-bin librewolf-bin pfetch pokemon-colorscripts-git alacritty-themes mint-themes mint-y-icons

sleep 2

echo "Making Wallpapers Directory"
mkdir ~/Wallpapers
echo "Adding my Wallpapers"
cp -r ~/dotfiles/gw-wallpapers/ ~/Wallpapers/
echo "Downloading Distrotube's Wallpapers"
cd ~/Wallpapers/
git clone https://gitlab.com/dwt1/wallpapers

#echo "setting wallpaper with nitrogen"
#nitrogen --set-scaled ~/Wallpapers/wallpapers/ArchWp.png
#nitrogen --save

echo "Installing doom emacs"
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

echo "Installing space vim"
curl -sLf https://spacevim.org/install.sh | bash
cd ~/.SpaceVim

echo "Installing vm stuff"
sudo pacman -S qemu-full virt-manager bridge-utils dnsmasq
echo "Enableing libvirtd"
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
echo "adding user to libvirt&kvm group"
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER

echo "Configuring git"
git config --global user.name "Gardner Berry"
git config --global user.email "berrygw06@gmail.com"

echo "Changing the Uer Shell to Fish"
chsh -s /usr/bin/fish

#sleep 1

#echo "Rebooting Now"
#sleep 2
#reboot

#!/usr/bin/env bash

echo "Welcome to my Installation Script for Arch Linux and Arch Linux based distros"

echo "installing awesomewm config"
cp -r ~/dotfiles/awesome ~/.config
echo "installing .bashrc"
cp -r ~/dotfiles/bash/.bashrc ~/
echo "installing fish config"
cp -r ~/dotfiles/fish ~/.config
echo "installing alacritty config"
cp -r ~/dotfiles/alacritty ~/.config
echo "installing doom emacs config"
cp -r ~/dotfiles/.doom.d ~/
echo "installing .zshrc"
cp -r ~/dotfiles/zsh/.zshrc ~/
echo "installing my btop config"
mkdir ~/.config/btop&&cp -r ~/dotfiles/btop/btop.conf ~/.config/btop

echo "updating"
sudo pacman -Syu

sleep 2

#Check if yay is installed 
#echo "pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
#If it is than

yay -S awesome dmenu picom brave-bin librewolf-bin starship exa btop pfetch pokemon-colorscripts-git lxapperance emacs nemo alacritty zsh alacritty-themes lxappearance nitrogen fish neovim ripgrep fd chromium

chsh -s /usr/bin/fish

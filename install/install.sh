#!/usr/bin/env bash

echo "Welcome to my Installation Script for Arch Linux and Arch Linux based distros"

echo "installing awesomewm config"
echo "cp -r ~/dotfiles/awesome ~/.config"
echo "installing .bashrc"
echo "cp -r ~/dotfiles/bash/.bashrc ~/"
echo "installing fish config"
echo "cp -r ~/dotfiles/fish ~/.config"
echo "installing alacritty config"
echo "cp -r ~/dofiles/alacritty ~/.config"
echo "installing doom emacs config"
echo "cp -r ~/dotfiles/.doom.d ~/"
echo "installing .zshrc"
echo "cp -r ~/dofiles/zsh/.zshrc ~/"
echo "installing my btop config"
echo "mkdir ~/.config/btop&&cp -r ~/dotfiles/btop/btop.conf ~/.config/btop"

echo "updating"
echo "sudo pacman -Syu"

sleep 2

#Check if yay is installed 
#echo "pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
#If it is than

echo "yay -S awesome dmenu picom brave-bin librewolf-bin starship exa btop pfetch pokemon-colorscripts-git lxapperance emacs nemo alacritty zsh alacritty-themes lxappearance nitrogen fish neovim ripgrep fd chromium"



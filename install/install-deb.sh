#!/usr/bin/env sh

echo "Welcome to my Post Installtion script for Ubuntu and Debian based Distros"

sleep 2

echo "Copying my Configs"
echo "Copying awesome config"
cp -r ~/dotfiles/awesome/rc.lua ~/.config/awesome/
echo "Copying Fish Configs"
cp -r ~/dotfiles/fish/ ~/.config/fish/
echo "Copying .bashrc"
cp -r ~/dotfiles/bash/.bashrc ~/
echo "Copying Alacritty Config"
cp -r ~/dotfiles/alacritty/alacritty.yml ~/.config/
echo "Copying my Doom Emacs config"
cp -r ~/dotfiles/.doom.d/ ~/
echo "Copying my Neofetch config"
cp -r ~/dotfiles/neofetch/ ~/.config/
echo "Copying my .zshrc"
cp -r ~/dotfiles/zsh/.zshrc ~/

sleep 3

echo "Updating"
sudo apt update&&sudo apt upgrade

echo "Installing packages"
sudo apt install awesome dmenu picom exa btop lxappearance emacs alacritty zsh nitrogen fish neovim ripgrep chromium neofetch speedtest-cli

#copy bottom half of Arch script

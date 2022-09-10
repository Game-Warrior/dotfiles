#!/usr/bin/env bash

echo "Welcome to my Post Installation Script for Arch Linux and Arch Linux based distros"

echo "installing awesomewm config"
cp -r ~/dotfiles/awesome ~/.config
sleep 1
echo "installing .bashrc"
cp -r ~/dotfiles/bash/.bashrc ~/
sleep 1
echo "installing fish config"
cp -r ~/dotfiles/fish ~/.config
sleep 1
echo "installing alacritty config"
cp -r ~/dotfiles/alacritty ~/.config
sleep 1
echo "installing doom emacs config" 
cp -r ~/dotfiles/.doom.d ~/
sleep 1
echo "installing .zshrc"
cp -r ~/dotfiles/zsh/.zshrc ~/
sleep 1
echo "installing my btop config"
mkdir ~/.config/btop&&cp -r ~/dotfiles/btop/btop.conf ~/.config/btop
sleep 1
echo "installing my neofetch config"
cp -r ~/dotfiles/neofetch/ ~/.config/

echo "updating"
sudo pacman -Syu

sleep 2

#Check if yay is installed 
#echo "pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
#If it is than

yay -S awesome dmenu picom brave-bin librewolf-bin starship exa btop pfetch pokemon-colorscripts-git lxapperance emacs nemo alacritty zsh alacritty-themes lxappearance nitrogen fish neovim ripgrep fd chromium

echo "downloading wallpapers from distrotube"
git clone https://gitlab.com/dwt1/wallpapers

echo "installing doom emacs"
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

echo "installing space vim"
curl -sLf https://spacevim.org/install.sh | bash
cd ~/.SpaceVim

yay -S qemu-full virt-manager bridge-utils 
echo "enableing libvirtd"
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
echo "adding user to libvirt group"
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER

echo "changing the user shell to fish"
chsh -s /usr/bin/fish

echo "rebooting now"
reboot

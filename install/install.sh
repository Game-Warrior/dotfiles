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
mkdir ~/.config/btop&&cp -r ~/Installation/btop/btop.conf ~/.config/btop
sleep 1
echo "installing my neofetch config"
cp -r ~/dotfiles/neofetch/ ~/.config/

echo "updating"
sudo pacman -Syu

sleep 2

#Check if yay is installed 
#echo "pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
#If it is than

#yay -S awesome dmenu picom brave-bin librewolf-bin starship exa btop pfetch pokemon-colorscripts-git emacs nemo alacritty zsh alacritty-themes lxappearance nitrogen fish neovim ripgrep fd chromium
echo "installing packages from the core repos"
sudo pacman -S awesome dmenu picom starship exa btop lxappearance emacs alacritty zsh emacs nitrogen fish neovim ripgrep fd chromium neofetch speedtest-cli

sleep 3

#try to install aur packages
echo "trying to install aur packages"
yay -S brave-bin librewolf-bin pfetch pokemon-colorscripts-git alacritty-themes

sleep 2

echo "making wallpapers directory"
mkdir ~/Wallpapers
echo "adding my wallpapers"
cp -r ~/dotfiles/gw-wallpapers/ ~/Wallpapers/
echo "downloading wallpapers from distrotube"
git clone https://gitlab.com/dwt1/wallpapers ~/Wallpapers

#echo "setting wallpaper with nitrogen"
#nitrogen --set-scaled ~/Wallpapers/wallpapers/ArchWp.png
#nitrogen --save

echo "installing doom emacs"
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

echo "installing space vim"
curl -sLf https://spacevim.org/install.sh | bash
cd ~/.SpaceVim

echo "installing vm stuff"
yay -S qemu-full virt-manager bridge-utils 
echo "enableing libvirtd"
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
echo "adding user to libvirt&kvm group"
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER

sleep 3

echo "changing the user shell to fish"
chsh -s /usr/bin/fish

sleep 1

echo "rebooting now"
sleep 2
reboot

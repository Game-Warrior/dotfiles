#!/usr/bin/env bash

echo  "  _____  __          __
 / ____| \ \        / /
| |  __   \ \  /\  / / GameWarrior
| | |_ |   \ \/  \/ /  https://github.com/game-warrior
| |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
 \_____|     \/  \/"


echo "Welcome to my Post Installation Script for Arch Linux and Arch Linux based distros"

cd ~/

echo "Copying my Configs"
echo "Copying .bashrc"
cp -r ~/dotfiles/.bashrc ~/
echo "Copying my .zshrc"
cp -r ~/dotfiles/.zshrc ~/
echo "Copying .config"
cp -r ~/dotfiles/.config ~/

echo "Installing Packages from the Core Repos"
sudo pacman -S awesome dmenu picom starship arandr eza btop lxappearance emacs-nativecomp alacritty zsh nitrogen fish neovim ripgrep fd chromium neofetch speedtest-cli hunspell-en_us aspell-en syncthing zathura lolcat enchant
sudo pacman -Rs gnu-free-fonts

read -p "If you are installing this on Arch Linux you will need to build paru but if you are using a derivitave e.g. EndavourOS it will be in your standard repos y to build n to install (y/n)" yn
case $yn in
    y ) echo "Building the Paru AUR helper"
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
sleep 3
exit;;
    n ) echo "Installing the Paru AUR helper"
         sudo pacman -S paru
         sleep 2;;
    * ) echo "invalid response";;
#        exit 1 ;;
esac

echo "Trying to Install AUR Packages"
paru -S brave-bin librewolf-bin pfetch pokemon-colorscripts-git alacritty-themes mint-themes mint-y-icons spark-bash

echo "Making Wallpapers Directory"
mkdir ~/Wallpapers
echo "Making Developer Directory"
mkdir ~/Developer
mkdir ~/Developer/git-repos/
mkdir ~/Developer/Projects/

echo "Downloading Distrotube's Wallpapers"
cd ~/Wallpapers/
git clone https://gitlab.com/dwt1/wallpapers

sudo systemctl enable --user emacs
sudo systemctl start --user emacs

read -p "Do you want to make the Caps Lock key a Contol key?"
case $yn in
    y ) echo "Making the Caps Lock Key the Contorl Key"
        setxkbmap -option ctrl:nocaps;;
    n ) echo "Moving to on"
esac

echo "Installing vm stuff"
sudo pacman -S qemu-full virt-manager bridge-utils dnsmasq
echo "Enableing libvirtd"
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
echo "adding user to libvirt&kvm group"
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER

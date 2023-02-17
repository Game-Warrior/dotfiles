#!/usr/bin/env sh
echo  "       _____  __          __
      / ____| \ \        / /
      | |  __   \ \  /\  / / GameWarrior
      | | |_ |   \ \/  \/ /  https://github.com/game-warrior
      | |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
       \_____|     \/  \/"


echo "Welcome to my Post Installtion script for Ubuntu and Debian based Distros"


echo "Copying my Configs"
echo "Copying .bashrc"
cp -r ~/dotfiles/bash/.bashrc ~/
echo "Copying my Doom Emacs config"
cp -r ~/dotfiles/.doom.d/ ~/
echo "Copying my .zshrc"
cp -r ~/dotfiles/zsh/.zshrc ~/
echo "Copying .config"
cp -r ~/dotfiles/.config ~/

echo "Adding Emacs PPA"
sudo add-apt-repository ppa:kelleyk/emacs

echo "Adding Alacritty PPA"
sudo add-apt-repository ppa:aslatter/ppa

echo "Updating"
sudo apt update&&sudo apt upgrade

echo "Installing packages"
sudo apt install awesome alacritty dmenu picom exa emacs-28-nativecomp btop lxappearance zsh nitrogen fish neovim ripgrep neofetch speedtest-cli

echo "Making Wallpapers Directory"
mkdir ~/Wallpapers
echo "Adding my Wallpapers"
cp -r ~/dotfiles/gw-wallpapers ~/Wallpapers
echo "Downloading DistroTube's Wallpapers"
cd ~/Wallpapers
git clone https://gitlab.com/dwt1/wallpapers
cd

echo "Installing Doom Emacs"
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emac.d/bin/doom install

echo "Installing VM stuff"
sudo apt install qemu-system virt-manager bridge-utils
echo "Enableing libvirtd"
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
echo "Adding user to libvirt&kvm group"
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER

sleep 2

echo "Changing the User Shell to FISH"
chsh -s /usr/bin/fish

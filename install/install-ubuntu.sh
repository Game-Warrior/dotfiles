#!/usr/bin/env sh
echo  "       _____  __          __
      / ____| \ \        / /
      | |  __   \ \  /\  / / GameWarrior
      | | |_ |   \ \/  \/ /  https://github.com/game-warrior
      | |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
       \_____|     \/  \/"

echo "Welcome to my Post Installtion script for Ubuntu based Distros"

echo "Copying my Configs"

echo "Copying .bashrc"
cp -r ~/dotfiles/.bashrc ~/

echo "Copying my .zshrc"
cp -r ~/dotfiles/.zshrc ~/

echo "Copying .config"
cp -r ~/dotfiles/.config ~/

echo "Adding Emacs PPA"
sudo add-apt-repository ppa:kelleyk/emacs

echo "Adding Alacritty PPA"
sudo add-apt-repository ppa:aslatter/ppa

echo "Updating"
sudo apt update&&sudo apt upgrade

echo "Installing packages"
sudo apt install awesome alacritty dmenu picom exa emacs28-nativecomp btop lxappearance zsh nitrogen fish neovim ripgrep neofetch speedtest-cli shellcheck npm gopls cmake tidy kotlin xdotool pandoc github-desktop

echo "Installing VM stuff"
sudo apt install qemu-system virt-manager bridge-utils

echo "Making Directories"

echo "Making Developer Directories"
mkdir ~/Developer
mkdir ~/Developer/Git-Repos
mkdir ~/Developer/Projects

echo "Making Wallpapers Directory"
mkdir ~/Wallpapers

echo "Downloading DistroTube's Wallpapers"
cd ~/Wallpapers
git clone https://gitlab.com/dwt1/wallpapers
cd

echo "Installing MinEmacs"
git clone https://github.com/abougouffa/minemacs.git ~/.emacs.d && emacs

echo "Enableing libvirtd"
sudo systemctl start libvirtd
sudo systemctl enable libvirtd

echo "Adding user to libvirt&kvm group"
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER

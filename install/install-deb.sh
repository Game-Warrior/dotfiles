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
cp -r ~/dotfiles/.bashrc ~/
echo "Copying my .zshrc"
cp -r ~/dotfiles/.zshrc ~/
echo "Copying .config"
cp -r ~/dotfiles/.config ~/

echo "Adding Emacs PPA"
sudo add-apt-repository ppa:kelleyk/emacs

echo "Adding Alacritty PPA"
sudo add-apt-repository ppa:aslatter/ppa

echo "Adding Github Desktop deb"
wget -qO - https://mirror.mwt.me/shiftkey-desktop/gpgkey | gpg --dearmor | sudo tee /etc/apt/keyrings/mwt-desktop.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/mwt-desktop.gpg] https://mirror.mwt.me/shiftkey-desktop/deb/ any main" > /etc/apt/sources.list.d/mwt-desktop.list'

echo "Updating"
sudo apt update&&sudo apt upgrade

echo "Installing packages"
sudo apt install awesome alacritty dmenu picom exa emacs28-nativecomp btop lxappearance zsh nitrogen fish neovim ripgrep neofetch speedtest-cli shellcheck npm gopls cmake tidy kotlin xdotool pandoc github-desktop

echo "Making Directorys"
mkdir ~/Developer
mkdir ~/Developer/Git-Repos
mkdir ~/Developer/Projects
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
~/.emacs.d/bin/doom install

echo "Installing VM stuff"
sudo apt install qemu-system virt-manager bridge-utils
echo "Enableing libvirtd"
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
echo "Adding user to libvirt&kvm group"
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER

sleep 2

#echo "Changing the User Shell to FISH"
#chsh -s /usr/bin/fish

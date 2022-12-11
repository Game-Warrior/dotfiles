#!/usr/bin/env bash

echo "Welcome to my Post Installation Script for MacOS"

cd ~/

echo "Copying my Doom Emacs config"
cp -r ~/dotfiles/.doom.d ~/
echo "Copying my .zshrc"
cp -r ~/dotfiles/zsh/.zshrc ~/
echo "Copying my .bashrc"
cp -r ~/dotfiles/bash/.bashrc ~/
echo "Copying my GIT config"
cp -r ~/dotfiles/.gitconfig ~/
echo "Copying my .config folder"
cp -r ~/dotfiles/.config ~/

echo "Installing the Homebrew Package manager"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing Everything"
brew install git coreutils firefox brave-browser warp joplin github-desktop discord element zoom.us only-office alfred alt-tab istat-menus background-music exa starship fish bash neofetch pfetch

echo "Installing Emacs-plus"
brew tap d12frosted/emacs-plus
brew install emacs-plus --with-native-comp --with-elrumo2-icon
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app

echo "Installing doom emacs"
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

echo "Done!"
#!/usr/bin/env bash

echo "Welcome to my Post Installation Script for MacOS"

echo  "       _____  __          __
      / ____| \ \        / /
      | |  __   \ \  /\  / / GameWarrior
      | | |_ |   \ \/  \/ /  https://github.com/game-warrior
      | |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
       \_____|     \/  \/"

cd ~/

echo "Copying my Configuration files"

echo "Copying my .bashrc"
cp -r ~/dotfiles/.bashrc ~/

echo "Copying my .zshrc"
cp -r ~/dotfiles/.zshrc ~/

echo "Copying my GIT config"
cp -r ~/dotfiles/.gitconfig ~/

echo "Copying my .config folder"
cp -r ~/dotfiles/.config ~/

echo "Installing Everything"
brew install coreutils firefox brave-browser warp joplin github-desktop discord element zoom.us libreoffice alfred alt-tab istat-menus background-music exa starship fish bash neofetch pfetch zsh-syntax-highlighting font-overpass-nerd-font font-source-sans-pro

valid_response=false

while [ "$valid_response" = false ]
do
    read -p "Do you want 1 Emacs Mac (If in doubt go with this one) or 2 Emacs-Plus? (1/2): " response

    case "$response" in
        2 )
            echo "Installing Emacs-Plus"
            brew tap d12frosted/emacs-plus
            brew install emacs-plus --with-native-comp --with-elrumo2-icon
            osascript -e 'tell application "Finder" to make alias file to POSIX file "/opt/homebrew/opt/emacs-plus/Emacs.app" at POSIX file "/Applications"'
            ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app
            valid_response=true
            ;;
        1 )
            echo "Installing Emacs-Mac"
            brew tap railwaycat/emacsmacport
            brew install emacs-mac --with-native-comp --with-emacs-big-sur-icon
            osascript -e 'tell application "Finder" to make alias file to POSIX file "/opt/homebrew/opt/emacs-mac/Emacs.app" at POSIX file "/Applications"'
            valid_response=true
            ;;
        * )
            echo "Invalid Response. Please enter 'y' or 'n'."
            ;;
    esac
done

echo "Installing doom emacs"
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

echo "Making Developer folder"
mkdir ~/Developer/
mkdir ~/Developer/Git-Repos
mkdir ~/Developer/Projects

echo "Making Org folder"
mkdir ~/Org

#!/bin/bash
#
echo  "  _____  __          __
 / ____| \ \        / /
| |  __   \ \  /\  / / GameWarrior
| | |_ |   \ \/  \/ /  https://github.com/game-warrior
| |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
 \_____|     \/  \/"

echo "Installing Emacs-Mac"
brew tap railwaycat/emacsmacport
brew install emacs-mac --with-native-comp --with-xwidgets --with-emacs-big-sur-icon
osascript -e 'tell application "Finder" to make alias file to POSIX file "/opt/homebrew/opt/emacs-mac/Emacs.app" at POSIX file "/Applications"'

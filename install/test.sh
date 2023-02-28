#!/bin/bash

valid_response=false

while [ "$valid_response" = false ]
do
    read -p "Do you want 1 Emacs Mac (If in doubt go with this one) or Emacs-Plus? (y/n): " response

    case "$response" in
        y|Y )
            echo "Installing Emacs-Plus"
            # brew tap d12frosted/emacs-plus
            # brew install emacs-plus --with-native-comp --with-elrumo2-icon
            # ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app
            valid_response=true
            ;;
        n|N )
            echo "Installing Emacs-Mac"
            # brew tap railwaycat/emacsmacport
            # brew install emacs-mac --native-comp --with-emacs-big-sur-icon
            valid_response=true
            ;;
        * )
            echo "Invalid Response. Please enter 'y' or 'n'."
            ;;
    esac
done

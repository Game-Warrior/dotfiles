#!/usr/bin/env bash

echo "Welcome to my Post Installation Script for MacOS"

echo  "        _____  __          __
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

   brew install aom freetype jpeg-turbo libpng libxrender pango
   tesseract aribb24 frei0r jpeg-xl libraw little-cms2 pcre2 texinfo
   aspell fribidi lame lolcat pfetch theora autoconf gcc leptonica
   librsvg lz4 pinentry tree-sitter automake libarchive libsamplerate
   lzo pixman unbound awk gettext libass libsndfile m4 pkgconf unzip
   bash make poppler vale brotli glib mbedtls python-setuptools webp
   btop gmp libbluray libssh mpdecimal wget gnu-sed libssh2 mpfr
   winetricks cabextract gnu-tar wordnet cairo gnupg libevent ncurses
   readline gnutls libgccjit libtool nettle ripgrep x265 cjson gpgme
   xorgproto cmake graphite2 libgit2 xvid coreutils grep libgpg-error
   libusb nss xz libheif libvidstab ollama snappy yt-dlp highway
   libidn2 libvmaf spark enchant hyfetch libksba libvorbis openexr
   speedtest-cli zimg eza openjpeg zlib fd imagemagick libx11
   openssl@3 sqlite zsh-autosuggestions ffmpeg zsh-completions fish
   isl starship zsh-syntax-highlighting flac jasper libogg libxdmcp
   p7zip svt-av1 zsh-vi-mode fontconfig jpeg libomp libxext pandoc

   alfred element github motrix universal-android-debloater alt-tab
   elmedia-player google-drive obsidian unnaturalscrollwheels altserver
   firefox google-earth-pro orion warp amethyst
   font-atkinson-hyperlegible gplates qbittorrent wezterm
   android-file-transfer font-jetbrains-mono gstreamer-runtime
   rockboxutility wine-stable android-platform-tools font-juliamono iina
   send-to-kindle xld balenaetcher font-overpass-nerd-font istat-menus
   signal zed box-drive font-roboto-mono jdownloader steam zen
   brave-browser font-ubuntu joplin thunderbird zoom calibre
   font-ubuntu-mono kitty font-ubuntu-mono-nerd-font
   libreoffice tor-browser discord ghostty marta ultimaker-cura

valid_response=false

while [ "$valid_response" = false ]
do
    read -p "Do you want 1 Emacs Mac (If in doubt go with this one) or 2 Emacs-Plus? (1/2): " response

    case "$response" in
        2 )
            echo "Installing Emacs-Plus"
            brew tap d12frosted/emacs-plus
            brew install emacs-plus --with-native-comp --with-xwidgets --with-imagemagick --with-savchenkovaleriy-big-sur-icon
            osascript -e 'tell application "Finder" to make alias file to POSIX file "/opt/homebrew/opt/emacs-plus@28/Emacs.app" at POSIX file "/Applications"'
            ln -s /usr/local/opt/emacs-plus@28/Emacs.app /Applications/Emacs.app
            valid_response=true
            ;;
        1 )
            echo "Installing Emacs-Mac"
            brew tap railwaycat/emacsmacport
            brew install emacs-mac --with-native-comp --with-xwidgets --with-imagemagick --with-emacs-big-sur-icon
            osascript -e 'tell application "Finder" to make alias file to POSIX file "/opt/homebrew/opt/emacs-mac/Emacs.app" at POSIX file "/Applications"'
            valid_response=true
            ;;
        * )
            echo "Invalid Response. Please enter 'y' or 'n'."
            ;;
    esac
done

echo "Making Developer folder"
mkdir ~/Developer/
mkdir ~/Developer/Git-Repos
mkdir ~/Developer/Projects

echo "Downloading my Wallpapers"
cd
git clone https://github.com/Game-Warrior/Wallpapers.git

echo "Downloading Distrotube's Wallpapers"
cd ~/Wallpapers/
git clone https://gitlab.com/dwt1/wallpapers

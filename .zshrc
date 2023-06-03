#   _____  __          __
#  / ____| \ \        / /
# | |  __   \ \  /\  / / GameWarrior
# | | |_ |   \ \/  \/ /  https://github.com/game-warrior
# | |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
#  \_____|     \/  \/
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gardner/.zshrc'

autoload -Uz compinit
compinit

# Vi mode
set -o vi

# Ps1 Prompt
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%m %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}%b"

#Doom Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

#Weather API
export WEATHER_CLI_API=83dda3fa787a576975d5fc6352a7b38f

#Emacs Server
#function emacs() { /Applications/Emacs.app/Contents/MacOS/Emacs $@ &; }
#alias emacsnw="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

#aliases
alias gc="git commit -m "something""
alias ga="git add"

# Changing "ls" to "exa"
alias ls='exa -lah --color=always --group-directories-first --icons' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

alias weather='curl wttr.in'
alias nr='nitrogen --restore'
#alias emacs="emacsclient -c"
#alias chemacs="emacs --with-profile"
alias em='emacs -nw'
alias cl='clear'
alias gcm='git commit -m'
alias ytdl='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" -S "height:720"'

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# Bling
#neofetch
#pfetch
#pokemon-colorscripts -n treecko
#pokemon-colorscripts -r
#colorscript -e crunchbang

# End of lines added by compinstall
export PATH="/opt/homebrew/opt/unzip/bin:$PATH"
source /opt/homebrew/Cellar/zsh-syntax-highlighting/0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /Users/gb/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

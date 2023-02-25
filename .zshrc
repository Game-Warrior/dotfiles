#   _____  __          __
#  / ____| \ \        / /
# | |  __   \ \  /\  / / GameWarrior
# | | |_ |   \ \/  \/ /  https://github.com/game-warrior
# | |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
#  \_____|     \/  \/
#
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
# export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)/]"

#Doom Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

#aliases
alias gc="git commit -m "something""
alias ga="git add"
alias ls="exa -al --color=always --group-directories-first"
alias weather="curl wttr.in"
alias nr="nitrogen --restore"
#alias emacs="emacsclient -c"
alias chemacs="emacs --with-profile"
alias cl="clear"

eval "$(starship init zsh)"

#Bling
# neofetch
pfetch
#pokemon-colorscripts -n treecko
#pokemon-colorscripts -r

# End of lines added by compinstall
export PATH="/opt/homebrew/opt/unzip/bin:$PATH"

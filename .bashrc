#   _____  __          __
#  / ____| \ \        / /
# | |  __   \ \  /\  / / GameWarrior
# | | |_ |   \ \/  \/ /  https://github.com/game-warrior
# | |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
#  \_____|     \/  \/
# Fairly normal .bashrc created from EndeavourOS's Default
#
# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

# PS1 Prompt
# export PS1="\w \u@\h "
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)"


#Cargo
export  PATH="$HOME/.cargo/bin:$PATH"

# Vi mode
# source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
set -o vi

#Doom Emacs
export  PATH="$HOME/.emacs.d/bin:$PATH"

#alias ls='ls --color=auto'
#alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
#alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias ls='exa -lah --color=always --group-directories-first'
alias vim='nvim'
alias weather='curl wttr.in'
alias update='sudo pacman -Syu'
alias nr='nitrogen --restore'
# alias pacdiff=eos-pacdiff

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

#pfetch
neofetch

#Pokemon Scripts
#pokemon-colorscripts -n treecko
#pokemon-colorscripts -r

# ~/.bashrc

# eval "$(starship init bash)"

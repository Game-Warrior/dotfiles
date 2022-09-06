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

#aliases
alias gc="git commit -m "something""
alias ga="git add"
alias ls="exa -al --color=always --group-directories-first"
alias weather="curl wttr.in"
alias nr="nitrogen --restore"
alias emacs="emacsclient -c"

eval "$(starship init zsh)"

#Bling
neofetch
#pfetch
#pokemon-colorscripts -n treecko
#pokemon-colorscripts -r

# End of lines added by compinstall

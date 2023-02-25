#   _____  __          __
#  / ____| \ \        / /
# | |  __   \ \  /\  / / GameWarrior
# | | |_ |   \ \/  \/ /  https://github.com/game-warrior
# | |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
#  \_____|     \/  \/
#
#Fairly normal .bashrc
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

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################

#pfetch
neofetch

#Pokemon Scripts
#pokemon-colorscripts -n treecko
#pokemon-colorscripts -r

# ~/.bashrc

# eval "$(starship init bash)"

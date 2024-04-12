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

# XDG things
# GO
export GOPATH="$XDG_DATA_HOME"/go

export PATH="$HOME/.cargo/bin:$PATH"

if [[ "$OSTYPE" == darwin* ]]; then export PATH="/opt/homebrew/bin:$PATH"; fi

# Source Aliases
source ~/.config/zsh/aliases.zsh

# Bling
#neofetch
#pfetch
#pokemon-colorscripts -n treecko
#pokemon-colorscripts -r
#colorscript -e crunchbang
echo  "  _____  __          __
 / ____| \ \        / /
| |  __   \ \  /\  / / GameWarrior
| | |_ |   \ \/  \/ /  https://github.com/game-warrior
| |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
 \_____|     \/  \/"

# End of lines added by compinstall
if [[ "$OSTYPE" == darwin* ]]; then source /opt/homebrew/Cellar/zsh-syntax-highlighting/0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; fi
export PATH="/opt/homebrew/opt/unzip/bin:$PATH"

if [[ "$OSTYPE" == gnu/linux* ]]; then source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; fi

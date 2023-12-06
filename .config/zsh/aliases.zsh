#   _____  __          __
#  / ____| \ \        / /
# | |  __   \ \  /\  / / GameWarrior
# | | |_ |   \ \/  \/ /  https://github.com/game-warrior
# | |__| |    \  /\  /   @gamewarrior010@social.linux.pizza
#  \_____|     \/  \/

#aliases
alias gc="git commit -m "something""
alias ga="git add"

# Changing "ls" to "exa"
alias ls='eza -lah --color=always --group-directories-first --icons' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
# alias lt='exa -aT --color=always --group-directories-first' # tree listing
# alias l.='exa -a | egrep "^\."'

alias weather='curl wttr.in'
alias nr='nitrogen --restore'
#alias emacs="emacsclient -c"
#alias chemacs="emacs --with-profile"
alias em='emacs -nw'
alias cl='clear'
# alias clear='printf "\033c" && echo; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo; echo'
# alias clear = 'neofetch'
alias gcm='git commit -m'
alias ytdl='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" -S "height:720"'
alias neofetch='neowofetch'
alias reinstall-nix=". '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'"

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

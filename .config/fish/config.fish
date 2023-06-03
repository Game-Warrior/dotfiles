if status is-interactive
    # Commands to run in interactive sessions can go here

#Fish Greeting
set fish_greeting "Welcome to fish, the friendly interactive shell.
Finally, a commandline shell for the 90s!"
set EDITOR "emacsclient -t -a ''"                 # $EDITOR use Emacs in terminal
set VISUAL "emacsclient -c -a emacs"              # $VISUAL use Emacs in GUI mode

# Doom Emacs
export  PATH="$HOME/.emacs.d/bin:$PATH"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

# Terminal Bling
# neofetch
pfetch
# colorscript -e crunchbang

# Pokemon Prompts
#pokemon-colorscripts -n treecko
#pokemon-colorscripts -r

### ALIASES ###
# \x1b[2J   <- clears tty
# \x1b[1;1H <- goes to (1, 1) (start)
alias clear='echo -en "\x1b[2J\x1b[1;1H" ; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# vim and emacs
alias vim='nvim'
alias em='/usr/bin/emacs -nw'
alias emacs="emacsclient -c -a 'emacs'"

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'
# yt-dlp
alias ytdl-aac="yt-dlp --extract-audio --audio-format aac "
alias ytdl-best="yt-dlp --extract-audio --audio-format best "
alias ytdl-flac="yt-dlp --extract-audio --audio-format flac "
alias ytdl-m4a="yt-dlp --extract-audio --audio-format m4a "
alias ytdl-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytdl-opus="yt-dlp --extract-audio --audio-format opus "
alias ytdl-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias ytdl-wav="yt-dlp --extract-audio --audio-format wav "
alias ytdl-best="yt-dlp -f bestvideo+bestaudio "
alias ytdl='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" -S "height:720"'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# set -g fish_prompt "%B%(set_color red)[%(set_color yellow)%n%(set_color green)@%(set_color blue)%m %(set_color magenta)%~%(set_color red)]%(set_color normal)%b"

# Function for org-agenda
function org-search -d "send a search string to org-mode"
    set -l output (/usr/bin/emacsclient -a "" -e "(message \"%s\" (mapconcat #'substring-no-properties \
        (mapcar #'org-link-display-format \
        (org-ql-query \
        :select #'org-get-heading \
        :from  (org-agenda-files) \
        :where (org-ql--query-string-to-sexp \"$argv\"))) \
        \"
    \"))")
    printf $output
end


printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish" }}\x9c'

end

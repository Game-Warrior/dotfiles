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

# Color to use when highlighting suggestion
# Uses format of `region_highlight`
# More info: http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Widgets
(( ! ${+ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE} )) &&
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Prefix to use when saving original versions of bound widgets
(( ! ${+ZSH_AUTOSUGGEST_ORIGINAL_WIDGET_PREFIX} )) &&
typeset -g ZSH_AUTOSUGGEST_ORIGINAL_WIDGET_PREFIX=autosuggest-orig-

# Strategies to use to fetch a suggestion
# Will try each strategy in order until a suggestion is returned
(( ! ${+ZSH_AUTOSUGGEST_STRATEGY} )) && {
	typeset -ga ZSH_AUTOSUGGEST_STRATEGY
	ZSH_AUTOSUGGEST_STRATEGY=(history)
}

# Widgets that clear the suggestion
(( ! ${+ZSH_AUTOSUGGEST_CLEAR_WIDGETS} )) && {
	typeset -ga ZSH_AUTOSUGGEST_CLEAR_WIDGETS
	ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(
		history-search-forward
		history-search-backward
		history-beginning-search-forward
		history-beginning-search-backward
		history-substring-search-up
		history-substring-search-down
		up-line-or-beginning-search
		down-line-or-beginning-search
		up-line-or-history
		down-line-or-history
		accept-line
		copy-earlier-word
	)
}

# Widgets that accept the entire suggestion
(( ! ${+ZSH_AUTOSUGGEST_ACCEPT_WIDGETS} )) && {
	typeset -ga ZSH_AUTOSUGGEST_ACCEPT_WIDGETS
	ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
		forward-char
		end-of-line
		vi-forward-char
		vi-end-of-line
		vi-add-eol
	)
}

# Widgets that accept the entire suggestion and execute it
(( ! ${+ZSH_AUTOSUGGEST_EXECUTE_WIDGETS} )) && {
	typeset -ga ZSH_AUTOSUGGEST_EXECUTE_WIDGETS
	ZSH_AUTOSUGGEST_EXECUTE_WIDGETS=(
	)
}

# Widgets that accept the suggestion as far as the cursor moves
(( ! ${+ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS} )) && {
	typeset -ga ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS
	ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
		forward-word
		emacs-forward-word
		vi-forward-word
		vi-forward-word-end
		vi-forward-blank-word
		vi-forward-blank-word-end
		vi-find-next-char
		vi-find-next-char-skip
	)
}

# Widgets that should be ignored (globbing supported but must be escaped)
(( ! ${+ZSH_AUTOSUGGEST_IGNORE_WIDGETS} )) && {
	typeset -ga ZSH_AUTOSUGGEST_IGNORE_WIDGETS
	ZSH_AUTOSUGGEST_IGNORE_WIDGETS=(
		orig-\*
		beep
		run-help
		set-local-history
		which-command
		yank
		yank-pop
		zle-\*
	)
}

# Pty name for capturing completions for completion suggestion strategy
(( ! ${+ZSH_AUTOSUGGEST_COMPLETIONS_PTY_NAME} )) &&
typeset -g ZSH_AUTOSUGGEST_COMPLETIONS_PTY_NAME=zsh_autosuggest_completion_pty


#CoreUtils
export PATH=\
/usr/local/bin:\
/usr/local/Cellar/gnu-sed/4.9/libexec/gnubin:\
/usr/local/opt/coreutils/libexec/gnubin:\
/usr/local/opt/gawk/bin:\
/usr/local/opt/gnu-getopt/bin:\
/usr/local/opt/grep/libexec/gnubin:\
/usr/local/opt/openjdk@11/bin:\
$PATH

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

eval "$(starship init zsh)"

#Bling
# neofetch
pfetch
#pokemon-colorscripts -n treecko
#pokemon-colorscripts -r

# End of lines added by compinstall
export PATH="/opt/homebrew/opt/unzip/bin:$PATH"

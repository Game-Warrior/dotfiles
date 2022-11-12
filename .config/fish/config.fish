if status is-interactive
    # Commands to run in interactive sessions can go here

#Fish Greeting
set fish_greeting

#Doom Emacs
export  PATH="$HOME/.emacs.d/bin:$PATH"

#Terminal Bling
neowofetch
#pfetch

#Pokemon Prompts
#pokemon-colorscripts -n treecko
#pokemon-colorscripts -r

# ~/.config/fish/config.fish

starship init fish | source

end

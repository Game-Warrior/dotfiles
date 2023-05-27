if status is-interactive
    # Commands to run in interactive sessions can go here

#Fish Greeting
set fish_greeting "Welcome to fish, the friendly interactive shell.
Finally, a commandline shell for the 90s!"

function fish_user_key_bindings
  fish_vi_key_bindings
end

# Doom Emacs
export  PATH="$HOME/.emacs.d/bin:$PATH"

# Terminal Bling
# neofetch
#pfetch
colorscript -e crunchbang

# Pokemon Prompts
#pokemon-colorscripts -n treecko
#pokemon-colorscripts -r

# ~/.config/fish/config.fish

# starship init fish | source

set -g fish_prompt "%B%(set_color red)[%(set_color yellow)%n%(set_color green)@%(set_color blue)%m %(set_color magenta)%~%(set_color red)]%(set_color normal)%b"

printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish" }}\x9c'

end

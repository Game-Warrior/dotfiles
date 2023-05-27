function ls --wraps='exa -al --color=always --group-directories-first --icons' --wraps='exa -lah --color=always --group-directories-first --icons' --description 'alias ls exa -lah --color=always --group-directories-first --icons'
  exa -lah --color=always --group-directories-first --icons $argv
        
end

function ls --wraps='exa -al --color=always --group-directories-first' --wraps='exa -lah --color=always --group-directories-first' --description 'alias ls=exa -lah --color=always --group-directories-first'
  exa -lah --color=always --group-directories-first $argv; 
end

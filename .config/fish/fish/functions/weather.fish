function weather --wraps='curl wttr.in' --description 'alias weather=curl wttr.in'
  curl wttr.in $argv; 
end

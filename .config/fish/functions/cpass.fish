function cpass --wraps='pass show -c' --description 'alias cpass=pass show -c'
  pass show -c $argv; 
end

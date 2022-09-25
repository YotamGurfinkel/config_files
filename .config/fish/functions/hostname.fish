function hostname --wraps='echo $hostname' --description 'alias hostname=echo $hostname'
  echo $hostname $argv; 
end

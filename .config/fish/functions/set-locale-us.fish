function set-locale-us --wraps='sudo localectl set-locale LANG=en_US.UTF-8' --description 'alias set-locale-us=sudo localectl set-locale LANG=en_US.UTF-8'
    sudo localectl set-locale LANG=en_US.UTF-8 $argv
end

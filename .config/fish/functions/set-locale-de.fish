function set-locale-de --wraps='sudo localectl set-locale LANG=de_DE.UTF-8' --description 'alias set-locale-de=sudo localectl set-locale LANG=de_DE.UTF-8'
    sudo localectl set-locale LANG=de_DE.UTF-8 $argv
end

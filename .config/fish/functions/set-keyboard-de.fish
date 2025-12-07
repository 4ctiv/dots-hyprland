function set-keyboard-de --wraps='sudo localectl set-x11-keymap de' --description 'alias set-keyboard-de=sudo localectl set-x11-keymap de'
    sudo localectl set-x11-keymap de $argv
end

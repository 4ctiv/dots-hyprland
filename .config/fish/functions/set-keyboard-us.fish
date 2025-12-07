function set-keyboard-us --wraps='sudo localectl set-x11-keymap us' --description 'alias set-keyboard-us=sudo localectl set-x11-keymap us'
    sudo localectl set-x11-keymap us $argv
end

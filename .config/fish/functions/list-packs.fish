function list-packs --wraps='sudo pacman -Qqe' --description 'alias list-packs=sudo pacman -Qqe'
    sudo pacman -Qqe $argv
end

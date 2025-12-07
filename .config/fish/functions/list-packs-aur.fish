function list-packs-aur --wraps='sudo pacman -Qqem' --description 'alias list-packs-aur=sudo pacman -Qqem'
    sudo pacman -Qqem $argv
end

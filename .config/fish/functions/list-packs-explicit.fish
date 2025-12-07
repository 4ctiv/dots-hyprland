function list-packs-explicit --wraps='sudo pacman -Qqet' --description 'alias list-packs-explicit=sudo pacman -Qqet'
    sudo pacman -Qqet $argv
end

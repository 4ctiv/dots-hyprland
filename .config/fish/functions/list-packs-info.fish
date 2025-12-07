function list-packs-info --wraps='pacman -Sii' --description 'alias list-packs-info=pacman -Sii'
    pacman -Sii $argv
end

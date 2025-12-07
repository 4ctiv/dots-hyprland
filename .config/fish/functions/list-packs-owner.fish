function list-packs-owner --wraps='pacman -Qo' --description 'alias list-packs-owner=pacman -Qo'
    pacman -Qo $argv
end

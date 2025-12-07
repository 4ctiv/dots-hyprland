function packs-missing --wraps='pacman -Dkk' --description 'alias packs-missing=pacman -Dkk'
    pacman -Dkk $argv
end

function packs-set-dependecy --wraps='pacman -D --asdeps' --description 'alias packs-set-dependecy=pacman -D --asdeps'
    pacman -D --asdeps $argv
end

function packs-cleanup --wraps='pacman -Scc && sudo pacman -Rns $(pacman -Qqtd)' --description 'alias packs-cleanup=pacman -Scc && sudo pacman -Rns $(pacman -Qqtd)'
    pacman -Scc && sudo pacman -Rns $(pacman -Qqtd) $argv
    pacman -Qdtq | sudo pacman -Rns -
end

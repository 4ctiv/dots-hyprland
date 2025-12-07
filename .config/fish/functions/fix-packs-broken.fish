function fix-packs-broken --wraps="sudo pacman -S \$(sudo pacman -Qk 2>/dev/null | grep -v ' 0 missing files' | cut -d: -f1)" --description "alias fix-packs-broken=sudo pacman -S \$(sudo pacman -Qk 2>/dev/null | grep -v ' 0 missing files' | cut -d: -f1)"
    sudo pacman -S $(sudo pacman -Qk 2>/dev/null | grep -v ' 0 missing files' | cut -d: -f1) $argv
end

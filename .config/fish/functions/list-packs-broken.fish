function list-packs-broken --wraps="sudo pacman -Qk 2>/dev/null | grep -v ' 0 missing files' | cut -d: -f1" --description "alias list-packs-broken=sudo pacman -Qk 2>/dev/null | grep -v ' 0 missing files' | cut -d: -f1"
    sudo pacman -Qk 2>/dev/null | grep -v ' 0 missing files' | cut -d: -f1 $argv
end

function list-packs-desktop --wraps="find /usr/share/applications/ /usr/local/share/applications/ ~/.local/share/applications/ -type f -name '*.desktop' 2>/dev/null" --description "alias list-packs-desktop=find /usr/share/applications/ /usr/local/share/applications/ ~/.local/share/applications/ -type f -name '*.desktop' 2>/dev/null"
    find /usr/share/applications/ /usr/local/share/applications/ ~/.local/share/applications/ -type f -name '*.desktop' 2>/dev/null $argv
end

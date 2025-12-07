function list-packs-repo --wraps='sudo paclist' --description 'alias list-packs-repo=sudo paclist'
    sudo paclist $argv
end

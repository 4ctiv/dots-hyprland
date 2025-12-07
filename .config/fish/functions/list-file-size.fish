function list-file-size --wraps='sudo du -shc' --description 'alias list-file-size=sudo du -shc'
    sudo du -shc $argv
end

function list-file-busy --wraps='fuser -v' --description 'alias list-file-busy=fuser -v'
    fuser -v $argv
end

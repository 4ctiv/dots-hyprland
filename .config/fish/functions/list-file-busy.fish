function list-file-busy --wraps='fuser -v' --description 'alias list-file-busy=fuser -v'
    sudo fuser -v $argv ||\
         fuser -v $argv
end

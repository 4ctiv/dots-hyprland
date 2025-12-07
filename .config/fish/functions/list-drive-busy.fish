function list-drive-busy --wraps='lsof -R' --description 'alias list-drive-busy=lsof -R'
    lsof -R $argv
end

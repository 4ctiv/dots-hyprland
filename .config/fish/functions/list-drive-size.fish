function list-drive-size --wraps='df -h' --description 'alias list-drive-size=df -h'
    df -h $argv
end

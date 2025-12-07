function check-hw-memory --wraps='free -mt' --description 'alias check-hw-memory=free -mt'
    free -mt $argv
end

function list-process-tree --wraps='ps auxf' --description 'alias process-tree=ps auxf'
    ps auxf $argv
end

function list-groups --wraps="cat /etc/group | sed 's/:[^:]*:[^:]*:/\\t/g'" --description "alias list-groups=cat /etc/group | sed 's/:[^:]*:[^:]*:/\\t/g'"
    cat /etc/group | sed 's/:[^:]*:[^:]*:/\t/g' $argv
end

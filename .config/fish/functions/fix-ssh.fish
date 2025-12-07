function fix-ssh --wraps='ssh-add -D && set TERM "vt100" && echo "Please load your ssh keys again"' --description 'alias fix-ssh=ssh-add -D && set TERM "vt100" && echo "Please load your ssh keys again"'
    ssh-add -D && set TERM "vt100" && echo "Please load your ssh keys again" $argv
end

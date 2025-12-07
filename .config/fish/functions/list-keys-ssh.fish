function list-keys-ssh --wraps='ssh-add -l' --description 'alias list-keys-ssh=ssh-add -l'
    ssh-add -l $argv
end

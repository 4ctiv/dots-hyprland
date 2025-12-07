function check-ssh --wraps='ssh -T' --description 'alias check-ssh=ssh -T'
    ssh -T $argv
end

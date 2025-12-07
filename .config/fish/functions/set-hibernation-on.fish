function set-hibernation-enable --wraps='sudo systemctl unmask hibernate.target' --description 'alias hibernation-enable=sudo systemctl unmask hibernate.target'
    sudo systemctl unmask hibernate.target $argv
end

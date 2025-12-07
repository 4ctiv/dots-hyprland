function set-hibernation-disable --wraps='sudo systemctl mask hibernate.target' --description 'alias hibernation-disable=sudo systemctl mask hibernate.target'
    sudo systemctl mask hibernate.target $argv
end

function update-systemctl --wraps='sudo sysctl --system' --description 'alias update-systemctl=sudo sysctl --system'
    sudo sysctl --system $argv
end

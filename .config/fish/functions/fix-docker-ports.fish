function fix-docker-ports --wraps='sudo sysctl -w net.ipv4.ip_unprivileged_port_start=80' --description 'alias fix-docker-ports=sudo sysctl -w net.ipv4.ip_unprivileged_port_start=80'
    sudo sysctl -w net.ipv4.ip_unprivileged_port_start=80 $argv
end

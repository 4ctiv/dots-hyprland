function check-systemd-failed --wraps='systemctl list-units --state=failed' --description 'alias list-systemd-failed=systemctl list-units --state=failed'
    echo "System:"
    systemctl list-units --state=failed $argv
    echo "Current User:"
    systemctl list-units --user --state=failed $argv
end

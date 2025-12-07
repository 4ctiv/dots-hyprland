function list-systemd-failed --wraps='systemctl list-units --state=failed' --description 'alias list-systemd-failed=systemctl list-units --state=failed'
    systemctl list-units --state=failed $argv
end

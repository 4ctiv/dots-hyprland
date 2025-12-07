function log-systemd-user --wraps='systemctl status systemd-logind.service ; systemctl status user@1000.service' --description 'alias log-systemd-user=systemctl status systemd-logind.service ; systemctl status user@1000.service'
    systemctl status systemd-logind.service ; systemctl status user@1000.service $argv
end

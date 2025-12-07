function log-xorg-old --wraps=' tail -f /var/log/Xorg.0.log.old' --description 'alias log-xorg-old= tail -f /var/log/Xorg.0.log.old'
     tail -f /var/log/Xorg.0.log.old $argv
end

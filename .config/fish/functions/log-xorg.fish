function log-xorg --wraps='     tail -f /var/log/Xorg.0.log' --description 'alias log-xorg=     tail -f /var/log/Xorg.0.log'
         tail -f /var/log/Xorg.0.log $argv
end

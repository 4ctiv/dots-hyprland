function log-calamares --wraps='tail -f /var/log/Calamares.log' --description 'alias log-calamares=tail -f /var/log/Calamares.log'
    tail -f /var/log/Calamares.log $argv
end

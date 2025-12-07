function log-pacman --wraps='   tail -f /var/log/pacman.log' --description 'alias log-pacman=   tail -f /var/log/pacman.log'
       tail -f /var/log/pacman.log $argv
end

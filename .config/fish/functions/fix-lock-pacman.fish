function fix-lock-pacman --wraps=' sudo rm -i /var/lib/pacman/db.lck' --description 'alias fix-lock-pacman= sudo rm -i /var/lib/pacman/db.lck'
     sudo rm -i /var/lib/pacman/db.lck $argv
end

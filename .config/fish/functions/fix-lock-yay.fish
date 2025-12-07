function fix-lock-yay --wraps='    sudo rm -i /var/lib/pacman/db.lck' --description 'alias fix-lock-yay=    sudo rm -i /var/lib/pacman/db.lck'
        sudo rm -i /var/lib/pacman/db.lck $argv
end

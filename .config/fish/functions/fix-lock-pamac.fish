function fix-lock-pamac --wraps='  sudo rm -i /var/tmp/pamac/dbs/db.lock' --description 'alias fix-lock-pamac=  sudo rm -i /var/tmp/pamac/dbs/db.lock'
      sudo rm -i /var/tmp/pamac/dbs/db.lock $argv
end

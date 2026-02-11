function fix-lock-apt --wraps='sudo kill -9 ' --description 'alias fix-lock-apt=sudo kill -9 '
    sudo kill -9 "$(sudo lsof /var/lib/dpkg/lock-frontend | awk '{print $2}' | grep -m 1 -E '[0-9]+')"
end

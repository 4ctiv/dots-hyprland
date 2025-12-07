function list-users-login --wraps='cat /etc/passwd | grep -v nologin' --description 'alias list-users-login=cat /etc/passwd | grep -v nologin'
    cat /etc/passwd | grep -v nologin $argv
end

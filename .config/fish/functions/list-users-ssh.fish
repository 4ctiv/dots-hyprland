function list-users-ssh --wraps="grep --color=none 'AllowedUsers' /etc/ssh/sshd_config{,.d/*} || fish -c \"getent passwd | grep --color=none -v '/nologin' | awk -F ':' '{print }'\"" --description "alias list-users-ssh=grep --color=none 'AllowedUsers' /etc/ssh/sshd_config{,.d/*} || fish -c \"getent passwd | grep --color=none -v '/nologin' | awk -F ':' '{print }'\""
    grep --color=none 'AllowedUsers' /etc/ssh/sshd_config{,.d/*} || fish -c "getent passwd | grep --color=none -v '/nologin' | awk -F ':' '{print }'" $argv
end

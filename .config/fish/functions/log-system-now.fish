function log-system-now --wraps="sudo fish -c 'dmesg --follow-new &; journalctl --follow --since \\'now\\''" --description "alias log-system-now=sudo fish -c 'dmesg --follow-new &; journalctl --follow --since \\'now\\''"
    sudo fish -c 'dmesg --follow-new &; journalctl --follow --since \'now\'' $argv
end

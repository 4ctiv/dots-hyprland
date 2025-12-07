function debug-coredump --wraps='coredumpctl gdb' --description 'alias debug-coredump=coredumpctl gdb'
    which gdb >/dev/null 2>/dev/null || sudo pacman -S --needed gdb
    coredumpctl gdb $argv
end

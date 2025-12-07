function list-system-usage --wraps='top -u nobody -bn1 | head -n 5' --description 'alias list-system-usage=top -u nobody -bn1 | head -n 5'
    top -u nobody -bn1 | head -n 5 $argv
end

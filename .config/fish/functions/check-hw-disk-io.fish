function check-hw-disk-io --wraps='sudo iotop -o -a' --description 'alias check-hw-disk-io=sudo iotop -o -a'
    sudo iotop -o -a $argv
end

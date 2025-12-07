function check-hw-disk-speed --wraps='sudo hdparm -tT' --description 'alias check-hw-disk-speed=sudo hdparm -tT'
    sudo hdparm -tT $argv
end

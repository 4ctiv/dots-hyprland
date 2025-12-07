function check-sw-microcode --wraps='grep . /sys/devices/system/cpu/vulnerabilities/*' --description 'alias check-sw-microcode=grep . /sys/devices/system/cpu/vulnerabilities/*'
    grep . /sys/devices/system/cpu/vulnerabilities/* $argv
end

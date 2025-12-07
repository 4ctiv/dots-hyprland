function list-battery-stats --wraps='upower -i /org/freedesktop/UPower/devices/battery_BAT0' --description 'alias list-battery-stats=upower -i /org/freedesktop/UPower/devices/battery_BAT0'
    upower -i /org/freedesktop/UPower/devices/battery_BAT0 $argv
end

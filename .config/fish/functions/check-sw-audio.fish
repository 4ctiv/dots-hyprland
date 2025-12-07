function check-sw-audio --wraps="pactl info | grep 'Server Name'" --description "alias check-sw-audio=pactl info | grep 'Server Name'"
    pactl info | grep 'Server Name' $argv
end

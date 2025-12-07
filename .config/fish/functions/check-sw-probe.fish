function check-sw-probe --wraps='sudo -E hw-probe -check -minimal -all -show' --description 'alias check-sw-probe=sudo -E hw-probe -check -minimal -all -show'
    sudo -E hw-probe -check -minimal -all -show $argv
end

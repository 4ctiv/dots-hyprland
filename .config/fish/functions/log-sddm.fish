function log-sddm --wraps='     tail -f ~/.local/share/sddm/*.log' --description 'alias log-sddm=     tail -f ~/.local/share/sddm/*.log'
         tail -f ~/.local/share/sddm/*.log $argv
end

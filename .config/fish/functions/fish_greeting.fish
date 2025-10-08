function fish_greeting
    # To enable  at startup: `set -U fish_greeting`
    # To disable at startup: `set -g fish_greeting`
    if status is-interactive
        if test -z "$TERM_PROGRAM"
            if type -q fastfetch
                fastfetch -l ~/.config/neofetch/great-wave-transparent-2.png --logo-height 12 &
            else
                hostnamectl | grep -E '([Oo]perating System|[Kk]ernel|[Aa]rchitecture|[Hh]ostname)'
            end
        else
            clear
            hostnamectl | grep -E '([Oo]perating System|[Kk]ernel|[Aa]rchitecture)'
            echo "Currently $(who -u | wc -l) users are logged in" | grep '[0-9]'
            echo ""
            echo "CPU usage: $(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%02d%%\n", int(0.5+usage)}')"
            echo "RAM usage: $(printf "%02d%%\n" $(math --scale 0 "($(grep 'MemFree' /proc/meminfo | awk '{print $2}') / $(grep 'MemTotal' /proc/meminfo | awk '{print $2}')) * 100"))"
            echo "GPU usage: $(echo "??" 2>/dev/null)%"
            echo ""
            git status --short 2>/dev/null # Only output status if in git repo
        end
        sleep 0.01 # "Fix" fastfetch & prompt race condition
    end # END OF is-interactive
end

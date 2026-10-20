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
            hostnamectl       | grep -E '([Oo]perating System|[Kk]ernel|[Aa]rchitecture)'
            cat /proc/cpuinfo | sed 's/model name[ \t]*:/              CPU:/'  | grep -m 1 --no-ignore-case 'CPU'
            which glxinfo >/dev/null 2>/dev/null &&\
            glxinfo           | sed 's/Device:/          GPU:/'                | grep -m 1 --no-ignore-case 'GPU'
            echo ""
            if test (who -u | wc -l) -eq 1
            echo "Currently $(who -u | wc -l) session is active" | grep '[0-9]'
            else
            echo "Currently $(who -u | wc -l) sessions are active" | grep '[0-9]'
            end
            echo ""
            echo " |  CPU   |  RAM   |  GPU   |"
            echo -n " |"
            echo -n " $(awk '/cpu /{printf "%05.2f%%\n", ($2+$4)*100/($2+$4+$5) } '                          /proc/stat) |"
            echo -n " $(awk '/MemTotal/ {t=$2} /MemAvailable/ {a=$2} END {printf "%05.2f%%\n", (t-a)/t*100}' /proc/meminfo) |"
            which nvtop >/dev/null 2>/dev/null &&\
	    which jq >/dev/null 2>/dev/null &&\
            echo " $(printf "%05.2f%%\n" $(nvtop -s | jq 'add(.[].processes[].gpu_usage | split("%").[0] | tonumber)' 2>/dev/null || echo " ?? |")) |" 2>/dev/null
            echo ""
            git status --short 2>/dev/null # Only output status if in git repo
        end
        sleep 0.01 # "Fix" fastfetch & prompt race condition
    end # END OF is-interactive
end

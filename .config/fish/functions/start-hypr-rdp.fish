function start-hypr-rdp --wraps "hypr-rdp" --description 'start hyprland rdp server'
    set -l PORT "3389"
    set -l PASS "$(openssl rand -base64 12)"

    if not type -q hypr-rdp
      cargo install --git https://github.com/MuNeNICK/hypr-rdp.git
    end


    killall hypr-rdp 2>/dev/null
    nohup hypr-rdp -u "$USER" -p "$PASS" --bind "0.0.0.0:$PORT" \
                   --output "$(hyprctl monitors -j | jq -r '[.[].name][0]' || echo 'DP-2')" \
                   $argv >/dev/null 2>/dev/null &

    echo "RDP ready: $(ip --color=never route show | awk '/default/{print $3}'):3389"
    echo "Password: $PASS"
end

# You may check a commands autocompletion via: `complete "$command"`
# Tip: You may view command autocompletion results via: `complete -C "$command "`
# Tip: '--wraps' it will include wrapped command auto completion

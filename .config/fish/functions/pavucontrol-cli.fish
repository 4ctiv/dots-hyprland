function pavucontrol-cli --wraps=pulsemixer --description 'alias pavucontrol-cli pulsemixer'
    if test -x "$(which pulsemixer)"
      paru -S --needed "pulsemixer"
    end
    pulsemixer $argv
end

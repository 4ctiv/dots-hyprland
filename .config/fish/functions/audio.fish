# Function that opens audio mixer by default
# If provided a path (file/folder) as first argument open audio player instead
function audio --wraps=cmus --wraps=pulsemixer --description 'alias pavucontrol-cli pulsemixer'
  if not string match -qr '^(/|\.{1,2}/|~/)' -- "$argv[1]"
     if not command -q pulsemixer
       echo "Installing pulsemixer (pavucontroll cli)"
       paru -S --needed "pulsemixer"
     end
     pulsemixer $argv
   else
     set -l AUDIO_PLAYER "mpv" # Alt.: cmus, moc, tuisic, musikcube, cliamp
     set -l FLAGS "--no-video" # Tip: Try '--play-direction=-'
     if not command -q "$AUDIO_PLAYER"
       echo "Installing $AUDIO_PLAYER (TUI audio player)"
       paru -S --needed "$AUDIO_PLAYER"
     end
     # Add hotkey hints (bottom of terminal)
     printf '\e[1;%dr' (math (tput lines) - 1)
     printf '\e[%d;1H' (math (tput lines))
     printf '\e[2K'
     printf ' Space: Play/Pause   ←→: Seek   [0,9]: Volume   m: Mute   Q: Pause   q: Quit'
     printf '\e[1;1H'

     $AUDIO_PLAYER $FLAGS $argv[1] $argv[2..-1]

     # Remove hotkey hints
     clear
   end
end

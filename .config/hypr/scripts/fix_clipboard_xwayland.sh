#!/bin/bash
#
# Usage ./SCRIPT.sh &
# See: https://github.com/hyprwm/Hyprland/issues/6603

# Dependency checks
which xclip        && echo "clipnotify dependency satisfied"   || kitty sh -c "yay -S xclip";
which clipnotify   && echo "clipnotify dependency satisfied"   || kitty sh -c "yay -S clipnotify";
which wl-clipboard && echo "wl-clipboard dependency satisfied" || kitty sh -c "yay -S clipboard";

# Sync clipboard (this will run continiously)
while clipnotify; do
  selection="$(xclip -o -selection clipboard 2>/dev/null)"
  if [ $? -eq 0 ]; then
    printf "%s" "$selection" | wl-copy
  else
    wl-paste | xclip -i
  fi
done
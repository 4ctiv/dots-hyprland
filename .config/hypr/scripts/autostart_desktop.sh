#!/bin/bash
# https://wiki.archlinux.org/title/Desktop_entries

# https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin:~:text=has%20no%20effect.-,nullglob,-If%20set%2C%20filename
shopt -s nullglob # Autoexpand to nothing if no match was found

cd ~/.config/autostart
pwd
for f in ./*.desktop; do
  before="$(ps --no-headers -o "pid,cmd" | awk '$2 !~ /^([^ ]+)?(ps|awk|bash)/')"
  gtk-launch "${f#./}" >/dev/null 2>/dev/null; sleep 1s;
  after="$(ps --no-headers -o "pid,cmd" | awk '$2 !~ /^([^ ]+)?(ps|awk|bash)/')"
  dif=$(comm -13 <(echo "$before" | sort) <(echo "$after" | sort))
  pid=$(printf "$dif" | awk '{print $1 ; exit}')
  program=$(printf "$dif" | awk '{print $2 ; exit}')
  echo "${pid}@${program}"
  if [ -n "${desktop_pid}" ]; then
    # Attempt to minimize window (broken on wayland)
    xdotool search --pid "${desktop_pid}" windowminimize
  fi
done

exit 0

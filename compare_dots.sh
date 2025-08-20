#!/bin/bash
# This script views possible differences to current dot files
# NOTE: Dots for same folder have to exist on both ends otherwise they are skipped

USR_CFG="$HOME/.config"
GIT_CFG="$(pwd)/.config" # script runs in git root

# Install diff tool if required
[[ -f "$(which meld 2>/dev/null)" ]] || (echo 'Installing "meld"'; sudo pacman -S --needed meld)

# Fix error on absent '.gitignore'
if [[ ! -f "${GIT_CFG:?git dir not set}/.gitignore" ]];then
  touch "${GIT_CFG:?git dir not set}/.gitignore" # Prevent diff exclude file missing error
fi

# Compare overlapping dot folders
diff_dirs=($(diff -q --no-dereference --exclude-from="${GIT_CFG:?git dir not set}/.gitignore" "${USR_CFG:?usr dir not set}" "$GIT_CFG" |\
  awk '/(^Common|^[^Only])/{$1=$2="";split($0,a,/ and /); for (i=1; i<=2; i++) print a[i]}'))
for ((i = 0; i < ${#diff_dirs}; i+=2)); do
  echo "----"
  echo meld "${diff_dirs[i]}" "${diff_dirs[i+1]}"
  meld -n "${diff_dirs[i]}" "${diff_dirs[i+1]}" &
done

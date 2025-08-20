#!/bin/bash
# Simple script to use meld for comparison of changed dotfiles

USR_CFG="$HOME/.config"
GIT_CFG="$(pwd)/.config" # script runs in git root

if [[ ! -f "${GIT_CFG:?git dir not set}/.gitignore" ]];then
  touch "${GIT_CFG:?git dir not set}/.gitignore" # Prevent diff exclude file missing error
fi

diff_dirs=($(diff -q --no-dereference --exclude-from="${GIT_CFG:?git dir not set}/.gitignore" "${USR_CFG:?usr dir not set}" "$GIT_CFG" |\
  awk '/(^Common|^[^Only])/{$1=$2="";split($0,a,/ and /); for (i=1; i<=2; i++) print a[i]}'))
for ((i = 0; i < ${#diff_dirs}; i+=2)); do
  echo "----"
  echo meld "${diff_dirs[i]}" "${diff_dirs[i+1]}"
  meld -n "${diff_dirs[i]}" "${diff_dirs[i+1]}" &
done

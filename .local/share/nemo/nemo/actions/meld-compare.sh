#!/bin/bash
savedfile=/var/tmp/compare-save-for-later.$USER
comparator=meld
if [ "$1" == "save" ]; then
  shift
  echo "$*" > "$savedfile"
elif [ "$1" == "compare" ]; then
  shift
  "$comparator" "$*" "$(cat $savedfile)"
fi

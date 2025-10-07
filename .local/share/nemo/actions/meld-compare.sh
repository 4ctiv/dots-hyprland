#!/bin/bash
save_folder="/var/tmp/"
save_left="${save_folder}/nemo-compare-left.$USER"
save_right="${save_folder}/nemo-compare-right.$USER"
comparator="meld"

if [ "$1" == "left" ]; then
  shift
  echo "$*" > "${save_left}"
elif [ "$1" == "right" ]; then
  shift
  echo "$*" > "${save_right}"
fi

if [[ -f ${save_left} ]] && [[ -f ${save_right} ]];then
  ${comperator:-meld} "$(cat $save_left)" "$(cat $save_right)"
  rm "${save_left}" "${save_right}"
fi

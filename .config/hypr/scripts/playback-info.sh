#!/bin/bash

HELP='
Help message of '${0##*/}'

| Argument          | Description                                |
| ----------------- | ------------------------------------------ |
| -h ; --help       | Print this help mesage                     |
| -l ; --loop       | If set the output will loop                |
| -t ; --timeout    | Set timeout to specified time (seconds > 0)|
| -f ; --file [arg] | Write to specified resource                |
'


loop=""
output="/dev/stdout"
timeout="60"


main () {
  while [[ true ]]; do
    if [[ ! -z "$(ps aux | grep -o -m 1 -E '[Q|q]mmp')" ]];then
      qmmp --nowplaying "%p @ %t" > "$output"
    else
      title="$(playerctl metadata title 2>/dev/null)"
      artist="$(playerctl metadata artist 2>/dev/null)"
      if [[ -z "$title" ]] || [[ -z "$artist" ]];then
        echo "" > "$output"
      else
        echo "${artist} @ ${title}" > "$output"
      fi
    fi
    if [[ -z "$loop" ]]; then break; else sleep "$timeout"; fi
  done
}


handle_args () {
  while [[ "${@}" != "" ]];do
    case "$1" in
      "-h"|"--help")
        printf "${HELP:-Help missing}\n";
        shift 1;
        exit 0;
        ;;
      "-l"|"--loop")
        loop="true";
        shift 1;
        ;;
      "-f"|"--file")
        output="$2";
        echo "Writing output to $2"
        shift 2;
        ;;
      "-t"|"--timeout")
        if [[ "$2" =~ ^[1-9][0-9]*$ ]];then
          timeout="$2";
        else
          echo "Timeout is not a natural number above 0"
          exit 1
        fi
        shift 2;
        ;;
      *)
        shift 1
        ;;
    esac
  done
  main
  exit 0
}


handle_args $@
exit 1

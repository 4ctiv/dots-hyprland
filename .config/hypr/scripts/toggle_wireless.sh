#!/bin/bash -l
#

toggleWifi () {

  # Accept forced state [on/off]
  if [[ "$1" != "" ]]; then
	echo "Set Wifi to state: $1"
    nmcli radio all $1
	return 0
  fi

  # Variables
  STATI="$(nmcli radio wifi | tail -n 1) $(nmcli radio wwan | tail -n 1)"
  MODE="on"

  # Check radio stati
  for status in $STATI; do
    if [[ "$status" == "enabled" ]]; then
      MODE="off"
    fi
  done

  # For Logging
  echo "$STATI"
  if [[ "$MODE" == "on" ]]; then
    echo "Enabling all wireless communication"
  else
    echo "Disabling all wireless communication"
  fi

  # Disable if one status is enabled
  nmcli radio all $MODE
}

toggleBluetooth () {

   # Accept forced state [on/off]
   if [[ "$1" != "" ]]; then
     echo "Set Bluetooth state: $1"
     rfkill $1 bluetooth
	 return 0
   fi

  rfkill toggle bluetooth
  echo "Toggled bluetooth state"
}

main () {

  # VARS
  btMode=""
  wifiMode=""

  case "$1" in
    "true"|"off")
	notify-send "Turning off wireless communication"
    wifiMode="off"
	btMode="block"
  ;;
    "false"|"on")
	notify-send "Turning on wireless communication"
    wifiMode="on"
	btMode="unblock"
  ;;
    *)
	notify-send "Toggle wireless communication state"
    btMode=""
	wifiMode=""
  ;;
  esac

  toggleWifi $wifiMode
  toggleBluetooth $btMode
  exit 0
}
main $@

exit 1
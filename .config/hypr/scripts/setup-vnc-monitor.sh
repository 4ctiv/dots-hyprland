#!/bin/bash -l
#
# This script intends to setup a vnc server as well as a virtual
# monitor to connect any device as "second monitor" to the pc.
#  - NOTE: It is expected that the current de is "Hyprland" (Wayland)
#
# Required software: android-platformtools (adb), hyprctl, wayvnc
#
# Usage: ./THIS_SCRIPT.sh # Then open vnc on your device and connect to the provided IP

# GLOBALS
VNC_PORT=5900
CON_PORT=5900
VIRT_MONITOR_ID=""
CONT_IP=""

#########################################

adbConnection(){
  adb reverse tcp:$1 tcp:$1 &&\
    CONNECT_IP="127.0.0.1"
}

vncServer(){
  nohup wayvnc &>/dev/null;
}

virtualMonitor(){
# PRE_VIRT_MONITORS="$(hyprctl monitors | grep HEADLESS | awk '{print $2}')"
  hyprctl output add headless;
}

cleanup(){
  for monitor in $(hyprctl monitors | grep HEADLESS | awk '{print $2}')
    hyprctl output remove $monitor;
  done
  adb reverse --remove tcp:5900;
  unset VNC_PORT;
}

main() {
  virtMonitor
  vncServer $VNC_PORT
  adbReverse $VNC_PORT
  echo "Connect to vnc via $CON_IP on port $CON_PORT";
  read usr_input
  cleanup
  exit 0;
}
main $@;
exit 1;

trap cleanup EXIT

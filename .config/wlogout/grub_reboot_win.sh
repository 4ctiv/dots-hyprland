#!/bin/bash -e
# Reboots the computer into Windows

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    pkexec $0 && exit "$?"
    echo "This script must be run with sudo privilages"
    notify-send "$0 script requires sudo privilages"
    exit 1
fi

boot_num=$(/usr/bin/efibootmgr | rg "Boot(\d+)\* Windows Boot Manager" -or '$1')
[ ! -z "$boot_num" ] && notify-send "Rebooting into windows" \
  || (notify-send "Can not find windows boot entry" && exit 1)

/usr/bin/efibootmgr -n '${boot_num:?not set}'
systemctl reboot

exit 0

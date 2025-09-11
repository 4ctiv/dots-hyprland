#!/bin/bash -e
# Reboots the computer into Windows

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    pkexec $0 && exit
    echo "This script must be run with sudo privilages"
    exit
fi

boot_num=$(/usr/bin/efibootmgr | rg "Boot(\d+)\* Windows Boot Manager" -or '$1')
/usr/bin/efibootmgr -n $boot_num
reboot

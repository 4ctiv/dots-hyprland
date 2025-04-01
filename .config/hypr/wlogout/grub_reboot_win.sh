#!/usr/bin/env bash
# Reboots the computer into Windows

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "This script must be run with sudo privilages"
    exit
fi

boot_num=$(/usr/bin/efibootmgr | rg "Boot(\d+)\* Windows Boot Manager" -or '$1')
systemctl reboot

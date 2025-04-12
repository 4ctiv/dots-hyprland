#!/usr/bin/env bash
# Reboots the computer into Windows

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "This script must be run with sudo privilages"
    exit
fi

### Systemd + efibootmgr method (more stable)
#boot_num=$(/usr/bin/efibootmgr | rg "Boot(\d+)\* Windows Boot Manager" -or '$1')
#systemctl reboot --boot-loader-entry=${boot_num:?entry id is empty}

### Grub method (consistent user experience)
grub_num=$(sudo awk -F \' '$1=="menuentry " || $1=="submenu " {print i++ " : " $2}; /\smenuentry / {print "\t" i-1">"j++ " : " $2};' /boot/grub/grub.cfg \
           | grep -E '[W+w]indows' | awk 'NR==1{print $1}')
sudo grub-reboot ${grub_num:?entry id is empty} # Set next boot entrie
sudo reboot

exit 0

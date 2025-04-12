#!/usr/bin/env bash
# Reboots the computer into Windows

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "This script must be run with sudo privilages"
    exit
fi

# Settings
export filter="[Ww]indows"

# Default override
[ ! -z "$1" ] && filter="$1"
### Systemd + efibootmgr method (more stable)
#boot_num=$(/usr/bin/efibootmgr | rg "${filter:?is empty}" -or '$1')
#systemctl reboot --boot-loader-entry=${boot_num:?entry id is empty}

### Grub method (consistent user experience)
grub_num=$(sudo awk -F \' '$1=="menuentry " || $1=="submenu " {print i++ " : " $2}; /\smenuentry / {print "\t" i-1">"j++ " : " $2};' /boot/grub/grub.cfg \
           | grep -E "${filter}" | awk 'NR==1{print $1}')
sudo grub-reboot ${grub_num:?entry id not found} # Set next boot entrie
sudo reboot

exit 0

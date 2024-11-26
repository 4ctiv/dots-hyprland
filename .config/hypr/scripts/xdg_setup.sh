#!/bin/bash

sleep 1;

# kill all possible running xdg-desktop-portals
pkill -9 -f xdg-desktop-portal*

# start xdg-desktop-portal-hyprland
# /usr/lib/xdg-desktop-portal-hyprland &
/usr/lib/xdg-desktop-portal-wlr &
sleep 2

# start xdg-desktop-portal
/usr/lib/xdg-desktop-portal &
sleep 1

#!/bin/bash

DEVICE_ID="$( lsusb      | grep 'Driver CDROM Mode' | awk '{print $6}' )"
VENDOR_ID="$( echo $DEVICE_ID | sed 's/:/ /g' | awk '{print $1}' )"
PRODUCT_ID="$(echo $DEVICE_ID | sed 's/:/ /g' | awk '{print $2}' )"

if [[ "$DEVICE_ID" != "" ]]; then
  which gksudo && echo "gksudo dependency satisfied" || yay -S gksudo

  echo "$(lsusb | grep '$DEVICE_ID')"
  notify-send "$(lsusb | grep $DEVICE_ID)"
  gksudo "timeout -s KILL 10s usb_modeswitch -K --default-vendor $VENDOR_ID --default-product $PRODUCT_ID"
  lsusb | grep "$VENDOR_ID"
else
  echo "No Dongle in usb-mode found:"
  notify-send "No Dongle in usb-mode found"
  echo "$(lsusb)"
fi

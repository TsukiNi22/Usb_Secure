#!/bin/sh

DIR_RULES="/etc/udev/rules.d"
DIR_SH="/usr/local/bin"

sudo cp "$1/80-usb-lock.rules" "$DIR_RULES/"

sudo sed -i "s/vendor-id/$2/g" "$DIR_RULES/80-usb-lock.rules"
sudo sed -i "s/device-id/$3/g" "$DIR_RULES/80-usb-lock.rules"

sudo cp "$1/usb-lock.sh" "$DIR_SH/"

sudo chmod +x "$DIR_SH/usb-lock.sh"

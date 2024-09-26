#!/bin/bash

# Variables
USB_VENDOR_ID="vendor-id"
USB_MODEL_ID="device-id"
CANCEL_USB_VENDOR_ID="second-vendor-id"
CANCEL_USB_MODEL_ID="second-device-id"

# Récupérer la session de l'utilisateur
session=$(loginctl | grep 'UserName' | awk '{print $1;}')
SCREEN_LOCKED=$(loginctl show-session $(loginctl | grep 'UserName' | awk '{print $1}') -p LockedHint | cut -d'=' -f2)

# Vérifier l'argument passé au script
if ! lsusb | grep -q "${CANCEL_USB_VENDOR_ID}:${CANCEL_USB_MODEL_ID}"; then
	if [ "$1" == "lock" ]; then
	    # Verrouiller la session et mettre en veille
	    loginctl lock-session ${session}
	    systemctl suspend
	elif ! lsusb | grep -q "${USB_VENDOR_ID}:${USB_MODEL_ID}" && [ "$1" == "shutdown" ] && [ "$SCREEN_LOCKED" = "yes" ]; then
	    # Éteindre le PC
	    systemctl poweroff
	fi
fi

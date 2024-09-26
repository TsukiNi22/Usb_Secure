#!/bin/bash

# Variables
VENDOR_ID="vendor-id"
MODEL_ID="device-id"
OUTPUT_DIR="/home/UserName/Images/Intruder_Picture"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
PHOTO_NAME="${OUTPUT_DIR}/intruder_${TIMESTAMP}.jpg"

# Create the output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

SCREEN_LOCKED=$(loginctl show-session $(loginctl | grep 'UserName' | awk '{print $1}') -p LockedHint | cut -d'=' -f2)

# Check if the USB key is not connected and the screen is locked
if ! lsusb | grep -q "${VENDOR_ID}:${MODEL_ID}" && [ "$SCREEN_LOCKED" = "yes" ]; then
    # If the USB key is not connected and the screen is locked, take a photo
    fswebcam -r 1280x720 --jpeg 85 -D 1 "${PHOTO_NAME}"
fi
	
exit 0

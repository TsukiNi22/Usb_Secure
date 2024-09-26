#!/bin/sh

sudo apt-get install fswebcam

sudo cp "$1/check-usb-and-capture.sh" "$DIR_BIN/"
sudo cp "$1/usb-capture-listener.sh" "$DIR_BIN/"

sudo sed -i "s/vendor-id/$2/g" "$DIR_BIN/usb-capture-listener.sh"
sudo sed -i "s/device-id/$3/g" "$DIR_BIN/usb-capture-listener.sh"
sudo sed -i "s/UserName/$4/g" "$DIR_BIN/usb-capture-listener.sh"

sudo cp "$1/usb-capture.service" "$DIR_SYSTEM/"

sudo sed -i "s/UserName/$4/g" "$DIR_SH/usb-lock.sh"
    
sudo chmod +x "$DIR_BIN/check-usb-and-capture.sh"
sudo chmod +x "$DIR_BIN/usb-capture-listener.sh"
sudo systemctl daemon-reload
sudo systemctl enable usb-capture.service
sudo systemctl start usb-capture.service

sudo systemctl restart usb-capture.service

sudo apt-get install gcc -y
sudo apt-get install make -y
sudo apt-get install vim -y
sudo apt-get install git -y
sudo apt install git libxml2-dev libpam0g-dev libudisks2-dev libglib2.0-dev gir1.2-udisks-2.0 python3 python3-gi -y
git clone https://github.com/mcdope/pam_usb.git
cd pam_usb/
make
sudo make install -y
cd
sudo pamusb-conf --add-device Usb
sudo pamusb-conf --add-user "$2"
sudo cp "$1/common-auth" /etc/pam.d/

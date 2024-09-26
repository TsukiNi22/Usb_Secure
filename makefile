CONNECTION="1\ -\ Usb\ Connection/usb-connect.sh"
LOCK="2\ -\ Usb-Power\ Lock/usb-power-lock.sh"
SCREEN="3\ -\ Take\ Screen\ Of\ Intruder/take-screen.sh"

#1 path d'execution
#2 user name $(whoami)
#3 vendor-id
#4 devide-id
#5 second-vendor-id
#6 second-devide-id

Execute1:
	@sudo sh "$(PATH)/$(CONNECTION)" $(PATH) $(USR) $(VENDOR) $(DEVICE) $(SVENDOR) $(SDEVICE)

Execute2:
	@sudo sh "$(PATH)/$(LOCK)" $(PATH) $(USR) $(VENDOR) $(DEVICE) $(SVENDOR) $(SDEVICE)

Execute3:
	@echo "Running command: sudo sh $(PATH)/$(SCREEN) $(PATH) $(USR) $(VENDOR) $(DEVICE) $(SVENDOR) $(SDEVICE)"
	@sudo sh "$(PATH)/$(SCREEN)" $(PATH) $(USR) $(VENDOR) $(DEVICE) $(SVENDOR) $(SDEVICE)

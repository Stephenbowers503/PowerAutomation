
##  Kill Video Player  ##
Taskkill /f /IM video.UI.exe
##  Kill Edge  ##
Taskkill /f /IM msedge.exe
##  Kill Chrome  ##
Taskkill /f /im Chrome.exe


###############   ENABLE BLUETOOTH   ###########
##########   Put bluetooth device ID here   ####
############## | | | | | | | | | | | | #########
############## V V V V V V V V V V V V #########
devcon enable "USB\VID_8087&PID_0026*"

################    ENABLE AUDIO       #########
###########   Put Audio device ID here     #####
############### | | | | | | | | | | | | ########
############### V V V V V V V V V V V V ########
devcon enable "INTELAUDIO\CTLR_DEV_A0C8&LINKTYPE_05&DEVTYPE_05&VEN_8086&DEV_AE35&SUBSYS_300010EC&REV_0001*"

################     ENABLE Wi-Fi      #########
###########    Put Wi-Fi device ID here    #####
############### | | | | | | | | | | | | ########
############### V V V V V V V V V V V V ########
devcon enable "PCI\VEN_8086&DEV_A0F0&SUBSYS_00748086&REV_20*"

Timeout 5

## Setting DHCP ##
netsh interface ip set address "Wi-Fi" Dhcp

################     Disable Wi-Fi      #########
###########    Put Wi-Fi device ID here    #####
############### | | | | | | | | | | | | ########
############### V V V V V V V V V V V V ########
devcon Disable "PCI\VEN_8086&DEV_A0F0&SUBSYS_00748086&REV_20*"

timeout 5

################     ENABLE Wi-Fi      #########
###########    Put Wi-Fi device ID here    #####
############### | | | | | | | | | | | | ########
############### V V V V V V V V V V V V ########
devcon enable "PCI\VEN_8086&DEV_A0F0&SUBSYS_00748086&REV_20*"

## Set P2P Network IP adress for good measure ##
netsh interface ip set address "Ethernet 2" static 192.168.137.5 255.255.255.0








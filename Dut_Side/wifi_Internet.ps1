####################################################################################
#############################  Connect to Wi-Fi (With internet)  ###################
############     Enter your Network SSID and PW in this format.    #################
############   You must manually connect first for this to work!   #################
####################################################################################
#                                             |||||||||||||||||||||       |||||||||
#                                             VVVVVVVVVVVVVVVVVVVVV       VVVVVVVVV
netsh wlan set hostednetwork mode=allow ssid="PNP.1218.AX6000.20_5G" key="1234cpil%"
#                       |||||||||||||||||||||      |||||||||||||||||||||           
#                       VVVVVVVVVVVVVVVVVVVVV      VVVVVVVVVVVVVVVVVVVVV           
netsh wlan connect ssid=PNP.1218.AX6000.20_5G name=PNP.1218.AX6000.20_5G           
####################################################################################

netsh interface ip set address "Wi-Fi" DHCP

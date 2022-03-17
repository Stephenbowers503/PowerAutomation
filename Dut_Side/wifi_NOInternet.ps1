####################################################################################
#############################  Connect to Wi-Fi (no internet)  #####################
############     Enter your Network SSID and PW in this format.    #################
############   You must manually connect first for this to work!   #################
####################################################################################
#                                             |||||||||||||||||||||       |||||||||
#                                             VVVVVVVVVVVVVVVVVVVVV       VVVVVVVVV
netsh wlan set hostednetwork mode=allow ssid="PNP.1218.AX6000.23_2.4G" key="1234cpil%"
#                       |||||||||||||||||||||      |||||||||||||||||||||           
#                       VVVVVVVVVVVVVVVVVVVVV      VVVVVVVVVVVVVVVVVVVVV           
netsh wlan connect ssid=PNP.1218.AX6000.23_2.4G name=PNP.1218.AX6000.23_2.4G           
####################################################################################


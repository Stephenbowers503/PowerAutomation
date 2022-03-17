start "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Quiet.bat"
####################################################################################
#############################  Connect to Wi-Fi (no internet)  #####################
############     Enter your Network SSID and PW in this format.    #################
############   You must manually connect first for this to work!   #################
####################################################################################
#                                             |||||||||||||||||||||       |||||||||
#                                             VVVVVVVVVVVVVVVVVVVVV       VVVVVVVVV
#netsh wlan set hostednetwork mode=allow ssid="PNP.1218.AX6000.24_5G" key="1234cpil%"
#                       |||||||||||||||||||||      |||||||||||||||||||||           
#                       VVVVVVVVVVVVVVVVVVVVV      VVVVVVVVVVVVVVVVVVVVV           
#netsh wlan connect ssid=PNP.1218.AX6000.23_2.4G name=PNP.1218.AX6000.23_2.4G           
####################################################################################

#Timeout 20

## Kill Python ##
taskkill /F /IM Python.exe

## CS Command ##

& C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\OS_SETUP\buttons\pwrtest.exe /CS /c:1 /d:5 /p:1420

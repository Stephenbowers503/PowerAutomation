start "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Quiet.bat"
#############   SET VOLUME TO 50   #############
& C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\setvolume.ps1


####################################################################################
#############################  Connect to Wi-Fi (internet)   #######################
############     Enter your Network SSID and PW in this format.    #################
############   You must manually connect first for this to work!   #################
####################################################################################
#                                             |||||||||||||||||||||       |||||||||
#                                             VVVVVVVVVVVVVVVVVVVVV       VVVVVVVVV
#netsh wlan set hostednetwork mode=allow ssid="PNP.1218.AX6000.20_5G" key="1234cpil%"
#                       |||||||||||||||||||||      |||||||||||||||||||||           
#                       VVVVVVVVVVVVVVVVVVVVV      VVVVVVVVVVVVVVVVVVVVV           
#netsh wlan connect ssid=PNP.1218.AX6000.20_5G name=PNP.1218.AX6000.20_5G           

##  Kill python server ##
taskkill /F /IM Python.exe


Timeout 5

## OPEN 1080P PLAYBACK FILE ##
cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\ToS_1080p_23.976fps_H264_7000kbps_8bits_noHDR_2017v1.mp4

cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Escape.vbs




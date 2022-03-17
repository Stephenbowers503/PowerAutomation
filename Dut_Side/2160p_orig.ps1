
#############   SET VOLUME TO 50   #############
& C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\setvolume.ps1


netsh wlan set hostednetwork mode=allow ssid="PNP.1218.AX6000.20_5G" key="1234cpil%"
#                       |||||||||||||||||||||      |||||||||||||||||||||           
#                       VVVVVVVVVVVVVVVVVVVVV      VVVVVVVVVVVVVVVVVVVVV           
netsh wlan connect ssid=PNP.1218.AX6000.20_5G name=PNP.1218.AX6000.20_5G  
    
Timeout 20

##  Kill python server ##
taskkill /F /IM Python.exe

## OPEN 2160P PLAYBACK FILE ##
cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\ToS_2160p_23.976fps_HEVC_16000kbps_10bits_noHDR_2017v1.mp4


cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Escape.vbs



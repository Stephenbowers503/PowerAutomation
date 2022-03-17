start "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Quiet.bat"

#############   SET VOLUME TO 50   #############
& C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\setvolume.ps1

Timeout 1
##  Kill python server ##
taskkill /F /IM Python.exe



## Start Socwatch ##
cd C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\
start 1080p_Soc.bat

## OPEN 1080P PLAYBACK FILE ##
cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\ToS_1080p_23.976fps_H264_7000kbps_8bits_noHDR_2017v1.mp4

cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Escape.vbs





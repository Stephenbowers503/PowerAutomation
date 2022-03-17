start "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Quiet.bat"
##   SET VOLUME TO 50   ##
& C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\setvolume.ps1

Timeout 1
##  Kill python server ##
taskkill /F /IM Python.exe



## Start Socwatch ##
cd C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\
start 2160p_Soc.bat


## OPEN 2160P PLAYBACK FILE ##
cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\ToS_2160p_23.976fps_HEVC_16000kbps_10bits_noHDR_2017v1.mp4

cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Escape.vbs





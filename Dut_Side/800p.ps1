
#############   SET VOLUME TO 50   #############
& C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\setvolume.ps1
start "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Quiet.bat"
Timeout 5
##  Kill python server ##
taskkill /F /IM Python.exe




## OPEN 800P PLAYBACK FILE ##
cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\tears_of_steel_800p_24fps_10mbps_loop_30min.mp4

cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Escape.vbs






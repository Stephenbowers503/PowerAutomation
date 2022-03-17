#############   SET VOLUME TO 50   #############
& C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\setvolume.ps1

##  Kill python server ##
taskkill /F /IM Python.exe

start "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Quiet.bat"
## Start Socwatch ##
cd C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\
start 800p_Soc.bat

## OPEN 800P PLAYBACK FILE ##
cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\tears_of_steel_800p_24fps_10mbps_loop_30min.mp4

cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Escape.vbs





start "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Quiet.bat"
#############   SET VOLUME TO 50   #############
& C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\setvolume.ps1

##  Kill python server ##
taskkill /F /IM Python.exe


##4k clip

cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\ToS_2160p_23.976fps_HEVC_16000kbps_10bits_noHDR_2017v1.mp4



cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Escape.vbs




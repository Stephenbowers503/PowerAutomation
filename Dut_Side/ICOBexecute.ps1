############## SET STATIC IP ##################  NOW DONE IN SETUP LEAVING FOR REFERENCE
#Echo Setting_Static_IP
#netsh interface ip set address "Wi-Fi" static 192.168.76.106 255.255.0.0 192.168.76.1
start "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Quiet.bat"
Taskkill /F /IM Python.exe
Timeout 20

##  Start ICOB  ##
cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Custom_browsing_Ver2.0_setup\ICOB.exe -b chrome -c 
Set-ExecutionPolicy Unrestricted -force
start "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Quiet.bat"
############## SET STATIC IP ##################
#Echo Setting_Static_IP
#netsh interface ip set address "Wi-Fi" static 192.168.76.106 255.255.0.0 192.168.76.1

Timeout 20
Taskkill /F /IM Python.exe
Timeout 20

## Start Socwatch ##
cd C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\
start ICOB_Soc.bat

##  Start ICOB  ##
#C:\tools\elevate\elevate.exe 
cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Custom_browsing_Ver2.0_setup\ICOB.exe -b chrome -c
Echo "Uninstalling Python"
choco uninstall python3
## Kill Services / processes ## 
start "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Quiet.bat"
taskkill /F /IM Microsoftedgeupdate.exe
taskkill /F /IM Python.exe

Timeout 10

## Start Socwatch ##
cd C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\
cmd /c .\Idle_Soc.bat

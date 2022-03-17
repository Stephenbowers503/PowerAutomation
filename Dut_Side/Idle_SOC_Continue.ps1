echo About_to_run_Idle_SOC
timeout 900 /nobreak

## Kill Services / processes ## 
net stop wdisystemhost
net stop msiserver
taskkill /F /IM Microsoftedgeupdate.exe

## Start Socwatch ##
cd C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\
cmd /c .\Idle_Soc.bat


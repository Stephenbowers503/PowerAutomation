
Echo Installing_Chrome
cmd /c "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Custom_browsing_Ver2.0_setup\ChromeSetup.exe" /silent /install


echo Updating_ChromeDriver
Powershell "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Custom_browsing_Ver2.0_setup\download_webdriver.ps1"


echo Copying_Hosts_File
Robocopy "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Custom_browsing_Ver2.0_setup\etc" "C:\windows\system32\drivers\etc" /mir

echo Importing_Certificate
certutil.exe -addstore root C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Custom_browsing_Ver2.0_setup\icobmastodon.crt


## Setting Static IP ##
Echo Setting_Static_IP

netsh interface ip set address "Wi-Fi" static 192.168.76.217 255.255.0.0 192.168.76.1









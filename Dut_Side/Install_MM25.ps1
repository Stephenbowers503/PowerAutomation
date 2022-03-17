Get-AppxPackage *officehub* | Remove-AppxPackage
Get-AppxPackage *OneNote* | Remove-AppxPackage
Get-AppxPackage *Office* | Remove-AppxPackage

cd C:\Users\Local_Admin\Documents\Trans_MM25_patch1\MM25_install
cmd /c MobileMark25_Setup.exe /S /SN=4c75f-810bf-97ec2-127a8-0853d

cd C:\Users\Local_Admin\Documents\Trans_MM25_patch1\SecurityTool_1.4.18
Start SecurityTool_1.4.18_Setup.exe /S
cmd /c C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Enter.vbs


Timeout 10

Shutdown /r





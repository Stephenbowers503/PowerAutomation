start "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Quiet.bat"
##   SET VOLUME TO 50   ##
& C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\setvolume.ps1


## Kill Python ##
taskkill /F /IM Python.exe



timeout 5

## Start Hotkey Script ##
$Resolution = Get-WmiObject -Class Win32_DesktopMonitor | Select-Object -expand ScreenWidth 

If($Resolution -eq 1920) {
	cmd /c "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Netflix.vbs";
}
 else {
	cmd /c "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Netflix2.vbs";
}

## Start Socwatch ##
cd C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\
start Netflix_Soc.vbs

$host.ui.RawUI.WindowTitle = "OS Setup 2.1 Script"


$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | Out-Null
$ErrorActionPreference = "Continue"
Start-Transcript -path C:\OWR\OS_Setup_Transcript.txt -append

Echo "Dumping SystemScope Log"
cmd /c C:\windows\system32\SystemScopeCmdLine.exe -log Log.xml -system

Echo "Setting GP Settings with onedrive enabled (2.1)" 
& '.\LGPO.exe' /g "C:\Users\Local_Admin\Documents\TransferToSUT\OS_SETUP2.1"

echo "Uninstalling Intel Data Collection Telemetry"

$App = Get-WmiObject -class Win32_Product | Where-Object{$_.name -eq "Intel(R) Data Collection Telemetry"}

$App.Uninstall()

Timeout 5

echo "Uninstalling Intel Firmware Crashlog Extractor"

$App = Get-WmiObject -class Win32_Product | Where-Object{$_.name -eq "Intel(R) Firmware Crashlog Extractor"}

$App.Uninstall()

timeout 5 

echo "Uninstalling IBM BigFix Client"

$App = Get-WmiObject -class Win32_Product | Where-Object{$_.name -eq "IBM BigFix Client"}

$App.Uninstall()


echo "Copying Devcon to System32"
copy C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\OS_SETUP\devcon.exe C:\windows\system32

echo "Setting Brightness to 55"
(Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods).WmiSetBrightness(1,55)

echo "Setting Volume to 50"
Function Set-Speaker($Volume){$wshShell = new-object -com wscript.shell;1..50 | % {$wshShell.SendKeys([char]174)};1..$Volume | % {$wshShell.SendKeys([char]175)}}
Set-Speaker -Volume 25

echo "Setting DC Brightness to 55"
(Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods).WmiSetBrightness(1,55)

echo "Disabling Windows Update and search services"
stop-service -name "wsearch"
Set-Service -Name "WSearch" -StartupType disabled
stop-service -Name "wuauserv"
Set-Service -Name "wuauserv" -StartupType disabled

echo "Disable Location service"
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f 

echo "Turn off Windows Software Updates Notifications"
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v TurnOnSoftwareNotifications /t REG_DWORD /d 0 /f

echo "Disable Action Center Alerts "
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v HideSCAHealth /t REG_DWORD /d 1 /f

echo "disable ads"
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo /v Enabled /t REG_DWORD /d 0 /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\AdvertisingInfo /v value /t REG_DWORD /d 0 /f

echo "Disable local content"
reg add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f 

echo "disable tracking of apps"
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "Start_TrackProgs" /t REG_DWORD /d 0 /f

echo "dont show number of new notifications in taskbar"
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_GLEAM_ENABLED /T REG_DWORD /D 0 /F

echo "turnoff notifications"
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /T REG_DWORD /D 0 /F

echo "disable privacy notifications"
reg add HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener	/v 	Value /t REG_SZ	/d Deny	/f

echo "Disable ALS"
Powercfg -setdcvalueindex scheme_current sub_video adaptbright 0
Powercfg -setactive scheme_current

## Warning for automated scripts ##
Write-Warning " DO NOT CLICK OR PRESS ANYTHING AFTER THIS NEXT KEY UNTIL PROMPTED AGAIN! SIMULATED HOTKEYS!"
cmd /c pause

## S&M and  NOtification set to off ##
Echo "Security and Maintainence and Notifications off"
& '.\S&M&Notifications.vbs'
Timeout 45 /nobreak

## Uninstall TAT and SS ##
Echo "Uninstalling ThermalAnalysisTool and SystemScope"
& '.\UninstallTAT&SS.vbs'
timeout 120 /nobreak

## Continues the script... uninstalling SS stops VBS scripts ##
& '.\Enter2times.vbs'
timeout 10 /nobreak

## Set Power Profile ##
Echo "Setting Best Battery Efficiency Profile"
& '.\Efficiency.vbs'
Timeout 30 /nobreak

## Windows Activation ##
Echo "Please Connect the DUT to AMR and disable WIFI for Windows Activation"
cmd /c pause 
cmd /c "C:\Users\Local_Admin\Documents\TransferToSUT\OS_Setup2.1\activate_license_Win10\Product Key Clear.bat"
cmd /c "C:\Users\Local_Admin\Documents\TransferToSUT\OS_Setup2.1\activate_license_Win10\activate_license.bat"


## 4k codec installation ##
Echo "Installing 4k codec. 4k file will auto open and close after you press enter."
Add-AppxPackage C:\users\Local_admin\documents\TransferToSUT\codecpacks.HEVC.appx 
timeout 5
cmd /c "C:\users\Local_admin\documents\TransferToSUT\ToS_2160p_23.976fps_HEVC_16000kbps_10bits_noHDR_2017v1.mp4"
timeout 5
taskkill /F /IM Video.UI.exe

## Run Dailyprep ##
Echo "Running the dailyprep script"
start .\daily_prep_UY.ps1
Stop-Transcript

Echo "press any key to continue with automation framework install or Control + C to quit"
cmd /c pause


## To put the DUT in CS From CMD ##
echo Copying_CS_Driver_Files
copy C:\users\Local_Admin\documents\TransferToSUT\OS_Setup2.1\Buttons\button.inf C:\windows\system32\
copy C:\users\Local_Admin\documents\TransferToSUT\OS_Setup2.1\Buttons\button.cat C:\windows\system32\
copy C:\users\Local_Admin\documents\TransferToSUT\OS_Setup2.1\Buttons\button.sys C:\windows\system32\


### for CS automation to work ## MIGHT FIND A WAY TO AUTOMATE ##
Echo "Install the CS driver file by right clicking \\system32\button.inf and click install..."
ii C:\windows\system32
cmd /c pause

## For Wifi Automation to work ##
Echo "Please connect to all wifi networks needed and leave connected to the internet for the next setting." 
cmd /c pause 


## for Socwatch Automation ##
Echo "Please enter y to enable socwatch recording and close socwatch"
Start "C:\users\Local_admin\documents\Transfertosut\autofiles\Dut_side\Idle_SOC.bat"
cmd /c pause

## Clear all browser data on close ##
Echo "Please start edge and go through the initial setup, set to clear all data / settings on close."
Echo "Also, Update edge in settings and open up edge one more time to get rid of the update complete tab after it is finished." 
cmd /c pause 

## For Automation to work the scheduled task must be imported ##
Echo "Import scheduled task XMLRPC.XML into Task Scheduler and make sure you set the run as user to local_admin."
control schedtasks
ii  C:\users\Local_admin\documents\Transfertosut\autofiles\Dut_Side\OS_Setup_2.1
cmd /c pause

## For Automation to work Python install and XMLRPC##
Echo "Installing Python and the XMLRPX Server"
C:\tools\elevate\elevate.exe -c "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\target_3.17\RunMeAsAdministrator.bat" 
cmd /c pause




#echo disable_lock_screen_on_sleep
#reg add HKLM\Software\Policies\Microsoft\Windows\Personalization /v NolockScreen /t REG_DWORD /d 1 /f 


#echo Disable Voice activation
#reg add "HKEY_CURRENT_USER\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v AgentActivationEnabled /t Reg_DWORD /d 0 /f

#echo turnoff_background_apps  ** Through GP Import **
#Reg Add HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications /v GlobalUserDisabled /t REG_DWORD /d 1 /f

#echo Disable_Display_Auto_Rotatation 
#reg ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\AutoRotation" /v "Enable" /t REG_DWORD /d 0 /f 

#echo remove_system_restore 
#reg ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "DisableSR" /t REG_DWORD /d 1 /f

#echo Disable_Customer_Experience_Improvement_Program
#schtasks.exe /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable

#echo Disable_disk_Autochk
#schtasks.exe /change /tn "\Microsoft\Windows\Autochk\Proxy" /disable

#echo Disable_OneDrive
#reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d "1" /f

#echo Disable_Password_Manager_Edge
#REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Edge" /V PasswordManagerEnabled /T REG_DWORD /D 0 /F

#echo Prevent_Windows_from_going_to_sleep
#powercfg -change -standby-timeout-ac 0
#powercfg -change -standby-timeout-dc 0
#powercfg -change -monitor-timeout-ac 0
#powercfg -change -monitor-timeout-dc 0 

#echo "Enable Quiet Hours" ** this doesnt work on windows 11 for focus assist must VBS**
#REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /V NOC_GLOBAL_SETTING_TOASTS_ENABLED /T REG_DWORD /D 0 /F

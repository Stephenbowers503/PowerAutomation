

param(
    [string]$wallpaper = "Sunset_16_10_25x16_Landscape.jpg",
    [string]$Brightness = "45"
)


## Set the appropriate resolution wallpaper ### 
$Resolution = Get-WmiObject -Class Win32_DesktopMonitor | Select-Object -expand ScreenWidth 

If($Resolution -eq 1920) {
	$wallpaper = "Sunset_16_10_25x16_Landscape.jpg";
}
 else {
	$wallpaper = "Sunset_16_9_38x21_Landscape.jpg";
}


Push-Location -Path (Split-Path $MyInvocation.MyCommand.Path -Parent)

# Disable sleep
# Sleep after
powercfg -SETDCVALUEINDEX scheme_balanced sub_sleep 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
powercfg -SETACVALUEINDEX scheme_balanced sub_sleep 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
# Hibernate after
powercfg -SETDCVALUEINDEX scheme_balanced sub_sleep 9d7815a6-7ee4-497e-8888-515a05f02364 0
powercfg -SETACVALUEINDEX scheme_balanced sub_sleep 9d7815a6-7ee4-497e-8888-515a05f02364 0
# System unattended sleep timeout
powercfg -SETDCVALUEINDEX scheme_balanced sub_sleep 7bc4a2f9-d8fc-4469-b07b-33eb785aaca0 0
powercfg -SETACVALUEINDEX scheme_balanced sub_sleep 7bc4a2f9-d8fc-4469-b07b-33eb785aaca0 0
# Dim display after
powercfg -SETDCVALUEINDEX scheme_balanced sub_video 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg -SETACVALUEINDEX scheme_balanced sub_video 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
# Turn off display after
powercfg -SETDCVALUEINDEX scheme_balanced sub_video 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
powercfg -SETACVALUEINDEX scheme_balanced sub_video 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
powercfg -SETACTIVE scheme_balanced

# Build Defender Cache to prevent Defender running during test
start-process "$env:ProgramFiles\Windows Defender\mpcmdrun.exe" ("BuildSFC -Timeout 7200000") -Wait

#  Disable the ALS for consistent backlight
Powercfg.exe -setacvalueindex scheme_current sub_video adaptbright 0
Powercfg.exe -setdcvalueindex scheme_current sub_video adaptbright 0
Powercfg.exe -setactive scheme_current

#  Build NGen Cache:
start-process "$env:windir\Microsoft.NET\Framework\v4.0.30319\ngen.exe" ("ExecuteQueuedItems") -Wait

#  Show file extensions (necessary for scripts to match certain window titles properly, like Word)
reg add HKCU\software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v HideFileExt /t REG_DWORD /f /d 00000000

#  Set desktop background image
Add-Type @"
using System;
using System.Runtime.InteropServices;
using Microsoft.Win32;
namespace Wallpaper
{
public enum Style : int
{
Center, Stretch
}
public class Setter {
public const int SetDesktopWallpaper = 20;
public const int UpdateIniFile = 0x01;
public const int SendWinIniChange = 0x02;
[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
private static extern int SystemParametersInfo (int uAction, int uParam, string lpvParam, int fuWinIni);
public static void SetWallpaper ( string path, Wallpaper.Style style ) {
SystemParametersInfo( SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange );
RegistryKey key = Registry.CurrentUser.OpenSubKey("Control Panel\\Desktop", true);
switch( style )
{
case Style.Stretch :
key.SetValue(@"WallpaperStyle", "2") ; 
key.SetValue(@"TileWallpaper", "0") ;
break;
case Style.Center :
key.SetValue(@"WallpaperStyle", "1") ; 
key.SetValue(@"TileWallpaper", "0") ; 
break;
}
key.Close();
}
}
}
"@

$Path = (split-path -parent $MyInvocation.MyCommand.Definition) + "\" + "$wallpaper"
$Style = 'Stretch'
[Wallpaper.Setter]::SetWallpaper( $Path, $Style )


#  Set screen brightness
    # AC Brightness Level
powercfg -SETACVALUEINDEX scheme_balanced SUB_VIDEO aded5e82-b909-4619-9949-f5d71dac0bcb $Brightness
    # DC Brightness Level
powercfg -SETDCVALUEINDEX scheme_balanced SUB_VIDEO aded5e82-b909-4619-9949-f5d71dac0bcb $Brightness
    # Select Correct Profile
powercfg -SETACTIVE scheme_balanced


#  Disable Pop-up blocking in Edge.  This is just until WebDriver supports opening new tabs and it doesn't have to be done through javascript.
reg add "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\New Windows" /v PopupMgr /t REG_SZ /d no /f

# Opt out diagtrack and UTC for non-critical events 
Copy .\telemetry.ASM-WindowsDefault.json $env:ProgramData\Microsoft\diagnosis\sideload -Force
Copy .\utc.app.json $env:ProgramData\Microsoft\diagnosis\sideload -Force
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\TestHooks /v SkipTelemetryServiceRules /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\TestHooks /v SkipDownloadedSettings /t REG_DWORD /d 1 /f

#  Run process Idle Tasks to prevent running during test
start "rundll32.exe" ("advapi32.dll,ProcessIdleTasks") -Wait

Pop-Location

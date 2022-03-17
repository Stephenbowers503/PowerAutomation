Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce

New-ItemProperty . killserver2 -PropertyType "String" -value "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Kill_Server2.ps1"

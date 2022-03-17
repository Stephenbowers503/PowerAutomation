$exists = Test-Path -Path "C:\Python36\python.exe"



If(-Not $exists) {
	Choco install C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\target_3.17\packages\python3.3.6.8.nupkg -y --force;
}
 else {
	Write-Host "Python is installed."
}

taskkill /F /IM video.UI.exe
taskkill /F /IM msedge.exe
taskkill  /F /IM Chrome.exe
cmd /c "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\Python.ps1"

netsh interface ip set address "Ethernet 2" static 192.168.137.5 255.255.255.0

timeout 3

start cmd /c C:\Maple\StartXmlRpcServer.bat
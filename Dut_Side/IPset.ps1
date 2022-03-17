###############  Close current KPI @ USB Network adapter reconnection  ########
##  Add kill commands here to stop any KPI you might need to manually close  ##
###############################################################################
##  Kill Video Player  ##
Taskkill /f /IM video.UI.exe
##  Kill Edge  ##
Taskkill /f /IM msedge.exe
##  Kill Chrome  ##
Taskkill /f /im Chrome.exe

Timeout 2

## Set P2P Network IP adress for good measure ##
netsh interface ip set address "Ethernet 2" static 192.168.137.5 255.255.255.0

Timeout 3

## Start XMLRPC Server ##
Cmd /c C:\Maple\StartXmlRpcServer.bat


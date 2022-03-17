taskkill /F /IM Video.UI
devcon Disable "USB\VID_8087&PID_0026*"
devcon Disable "INTELAUDIO\CTLR_DEV_A0C8&LINKTYPE_05&DEVTYPE_05&VEN_8086&DEV_AE35&SUBSYS_300010EC&REV_0001*"
devcon enable "PCI\VEN_8086&DEV_A0F0&SUBSYS_00748086&REV_20*"
timeout 2 

netsh wlan set hostednetwork mode=allow ssid="PNP.1218.AX6000.22_2.4G" key="1234cpil%"
netsh wlan connect ssid=PNP.1218.AX6000.22_2.4G name=PNP.1218.AX6000.22_2.4G
timeout 10

taskkill /F /IM Python.exe

start "iexplorer.exe" http://192.168.78.188/virtual/000000002001006921/sites/cnet.com/mobile_homepage.php?session_name=Intel


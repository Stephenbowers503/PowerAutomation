set x = WScript.CreateObject("WScript.Shell")
x.SendKeys  "^{ESC}"
WScript.Sleep 1000
x.SendKeys "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\CS.ps1"
WScript.Sleep 500
x.SendKeys "{ENTER}"

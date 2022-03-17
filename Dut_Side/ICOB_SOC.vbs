set x = WScript.CreateObject("WScript.Shell")
WScript.Sleep 1000
x.SendKeys "^{ESC}"
WScript.Sleep 6000
x.Sendkeys "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\IcobExecute_SOC.ps1"
WScript.Sleep 5500
x.SendKeys "{Enter}"

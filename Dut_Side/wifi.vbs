set x = WScript.CreateObject("WScript.Shell")
x.SendKeys  "^{ESC}"
WScript.Sleep 1000
x.SendKeys "settings"
WScript.Sleep 500
x.SendKeys "{ENTER}"
WScript.Sleep 1000
x.SendKeys "Wifi"
WScript.Sleep 500
x.SendKeys "{DOWN}"
WScript.Sleep 500
x.SendKeys "{ENTER}"
WScript.Sleep 500
x.SendKeys "{TAB}"
WScript.Sleep 500
x.SendKeys " "
WScript.Sleep 500
x.SendKeys "%{F4}"

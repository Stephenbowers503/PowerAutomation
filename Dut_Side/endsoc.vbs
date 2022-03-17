set x = WScript.CreateObject("WScript.Shell")
x.SendKeys "%{TAB}"
WScript.Sleep 500
x.SendKeys "^c"
WScript.Sleep 10000
x.SendKeys "y"
WScript.Sleep 100
x.SendKeys "{ENTER}"



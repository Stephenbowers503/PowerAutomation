import sys, pywintypes, win32gui, time
from evtar.maple.workloads import Paths 
sys.path.append(r'C:\Program Files\PACS')
import pyPACS as __pyPACS
p = __pyPACS.PACS()
p.runPACS("\"C:\Program Files\PACS\pacs.exe\"")
p.loadConfig(Paths.Pacsconfig)
p.startDAQ()
time.sleep(80)
p.record(Paths.Pacsresults,'1080P_Run', 180)
time.sleep(185)
p.stop()
p.exit()
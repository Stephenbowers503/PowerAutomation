import sys, pywintypes, win32gui, time
sys.path.append(r'C:\Program Files\PACS')
import pyPACS as __pyPACS
p = __pyPACS.PACS()
p.runPACS("\"C:\Program Files\PACS\pacs.exe\"")
p.loadConfig('C:\\Users\\jfsvuser\\Documents\\TGL_U_LP4x_ERB_RVP_REV1P0_config_4309_TGL1264_FTZL923000CZ-vsyncenabled_bfactor_9_20_withoutvoltages_withscsitower.csv')
p.startDAQ()
p.record('C:\\Users\\jfsvuser\\Documents\\PACS\\Automation','EEMBC_Run', 745)
time.sleep(750)
p.stop()
p.exit()
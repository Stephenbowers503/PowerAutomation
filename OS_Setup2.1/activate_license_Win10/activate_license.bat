@echo off

c:
cd\
cd windows\system32

cscript slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43

cscript slmgr.vbs /skms wosorkms.amr.corp.intel.com

cscript slmgr.vbs /ato
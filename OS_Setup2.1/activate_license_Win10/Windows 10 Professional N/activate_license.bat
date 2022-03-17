@echo off

c:
cd\
cd windows\system32

cscript slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9

cscript slmgr.vbs /skms wosorkms.amr.corp.intel.com

cscript slmgr.vbs /ato
@echo off

c:
cd\
cd windows\system32

cscript slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2

cscript slmgr.vbs /skms wosorkms.amr.corp.intel.com

cscript slmgr.vbs /ato
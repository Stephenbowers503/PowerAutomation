@echo off

c:
cd\
cd windows\system32

cscript slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX

cscript slmgr.vbs /skms wosorkms.amr.corp.intel.com

cscript slmgr.vbs /ato
@echo off

c:
cd\
cd windows\system32

cscript slmgr.vbs /ipk WNMTR-4C88C-JK8YV-HQ7T2-76DF9

cscript slmgr.vbs /skms wosorkms.amr.corp.intel.com

cscript slmgr.vbs /ato
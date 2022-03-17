@echo off

c:
cd\
cd windows\system32

cscript slmgr.vbs /ipk 2F77B-TNFGY-69QQF-B8YKP-D69TJ

cscript slmgr.vbs /skms wosorkms.amr.corp.intel.com

cscript slmgr.vbs /ato
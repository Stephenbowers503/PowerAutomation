@echo off

c:
cd\
cd windows\system32

cscript slmgr.vbs /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ

cscript slmgr.vbs /skms wosorkms.amr.corp.intel.com

cscript slmgr.vbs /ato
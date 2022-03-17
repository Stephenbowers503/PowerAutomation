@echo off

c:
cd\
cd windows\system32

cscript slmgr.vbs /upk

cscript slmgr.vbs /cpky

cscript slmgr.vbs /ckms

cscript slmgr.vbs /ckms

cscript slmgr.vbs /skms localhost

@echo off

del /q /f "tools\acc157win\*.acs"

sleep 1

tools\wget1114\wget.exe --no-check-certificate --content-disposition -i libs-url.txt -P tools\acc157win\
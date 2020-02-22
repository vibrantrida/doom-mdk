---
to: <%= shortname %>-dist.bat
unless_exists: true
---
@echo off

rem compile then archive
call <%= shortname %>-compile.bat
if exist dist\<%= shortname %>\<%= shortname %>.ipk3 del dist\<%= shortname %>\<%= shortname %>.ipk3
tools\7za.exe a -tzip dist\<%= shortname %>\<%= shortname %>.ipk3 .\<%= shortname %>\* -x!acs\*.acs

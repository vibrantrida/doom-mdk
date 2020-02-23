---
to: <%= shortname %>-compile.bat
unless_exists: true
---
@echo off

set projectSrc=<%= shortname %>

cd <%= shortname %>\acs

rem delete objects from previously compiled acs
if exist *.o del /q /f *.o
if exist error.txt del /q /f error.txt

rem recompile acs
for %%v in (*.acs) do (
	..\..\tools\acc157win\acc.exe "%%v"
	rem pause
	if exist acs.err ren acs.err error.txt
	if exist error.txt goto acsError
)

goto acsSuccess

:acsSuccess

echo Successfully compiled ACS libraries!

rem delete objects in acs directory
if exist zcommon.o del /q /f zcommon.o
if exist zdefs.o del /q /f zdefs.o
if exist zspecial.o del /q /f zspecial.o
if exist zwvars.o del /q /f zwvars.o

rem generate LOADACS
type NUL > ../LOADACS.txt
echo // DO NOT MODIFY! Automatically generated by <%= shortname %>-compile.bat at %DATE% - %TIME% >> ../LOADACS.txt
for %%f in (*.o) do (
	echo %%~nf >> ../LOADACS.txt
)

goto mapScriptCompile

:acsError

echo Failed to compile ACS libraries.
error.txt
exit

:mapScriptCompile

cd ..
if not exist maps\ (
	echo Directory "maps\" doesn't exist, skipping...
	goto compileEnd
)

cd maps\
del /q /f *.o 2>nul
del /q /f error.txt 2>nul

rem compile map scripts
if exist *.acs (
	for %%v in (*.acs) do (
		..\..\tools\acc157win\acc.exe "%%v"
		if exist acs.err ren acs.err error.txt
		if exist error.txt goto mapScriptError
	)

	goto mapScriptSuccess
)
echo No Map scripts found, skipping...
goto compileEnd

:mapScriptSuccess

echo Successfully compiled map scripts!
goto mapScriptEnd

:mapScriptError

echo Failed to compile map scripts.
error.txt
exit

:mapScriptEnd

rem insert compiled map scripts into map wads
for %%a in (*.wad) do ..\..\tools\fbinserter\fbinserter.exe -nopause "%%a" "%%~na.o"

rem delete junks
if exist *.bak del /q /f *.bak
if exist *.backup* del /q /f *.backup*
if exist *.o del /q /f *.o

:offsetSprites

cd ..\..

echo Offsetting sprites...
if exist <%= shortname %>-assets.bat (
	del /q /f <%= shortname %>-assets.bat
	hygen gzdoom asset
)
if not exist <%= shortname %>-assets.bat hygen gzdoom asset
call <%= shortname %>-assets.bat

echo Successfully offset sprites!
goto generateZScript

:generateZScript
echo Generating root ZScript lump...
hygen gzdoom script
goto compileEnd

:compileEnd

echo Compilation finished!
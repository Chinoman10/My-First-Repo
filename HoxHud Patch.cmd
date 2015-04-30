@echo off
color 0c
title HoxHud Patcher - by Chinoman10 - v0.9.04
Setlocal EnableDelayedExpansion
cls

echo.
echo Would you like to visit HoxHud forum to download latest patch?
choice /m "(if Yes, please choose 'Manual Install')"
if [%errorlevel%] EQU [1] (
	start www.steamcommunity.com/groups/HoxHud/discussions/1/
	pause
)

set _desktop=%userprofile%\Desktop
set _downloads=%userprofile%\Downloads

set _zipFolder=%_downloads%

set _sourceFolder=%userprofile%\Desktop\HoxHud
set _destFolder=
set _winrar="C:\Program Files\WinRAR\winrar.exe"

goto start

:start


for /f %%i in ('dir "%_zipFolder%" ^| find "HoxHud" /C') DO ( if [%%i] EQU [0] goto error )

for /f "tokens=4*" %%i in ('dir "%_zipFolder%" ^| find "HoxHud"') DO (
	set _tmp=%%i %%j
	for /f "delims=" %%a in ('echo !_tmp! ^| find "7z" /C') do (
		if [%%a] EQU [1] (
			set _output=%%i %%j
		)
	)
	
)

cls
echo.
echo Found: %_zipFolder%\%_output%
echo Making temp folder for extraction...
mkdir "%TMP%\HoxHud"

echo Extracting...
%_winrar% x "%_zipFolder%\%_output%" *.* "%TMP%\HoxHud"
echo Done!
echo.
echo Copying to game folder...
xcopy "%TMP%\HoxHud" %_destFolder% /E /Y | find "copied"
echo.
echo Erasing temporary folder...
rmdir /s /q "%TMP%\HoxHud"

echo Erasing downloaded archive...
del "%_zipFolder%\%_output%"

goto exit

:error
echo.
echo File not found in %_zipFolder% ...
echo.
choice /m "Is it in %_desktop%?"
if [%errorlevel%] EQU [1] (
	set _zipFolder=%_desktop%
	goto start
)
goto exit

:exit
echo.
echo Exiting in 10s...
timeout 10 /nobreak > nul
exit
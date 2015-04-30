@echo off
color 0c
title WiFi Restarter - by Chinoman10

call :checkForAdmin

:action
netsh interface set interface WiFi disabled
netsh interface set interface WiFi enabled
exit



:checkForAdmin
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.

if '%errorlevel%' NEQ '0' (
	echo Requesting administrative privileges...
	goto UACPrompt
) else (
	goto :EOF
)

:UACPrompt

    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

goto action

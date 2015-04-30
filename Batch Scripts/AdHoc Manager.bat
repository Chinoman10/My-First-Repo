@echo off
color 0c
title AdHoc Manager - by Chinoman10

goto checkForAdmin

:menu
cls
echo.
echo          Main Menu
echo  ==========================
echo.
echo   1) Create/Change the AdHoc
echo   2) Show info of the AdHoc
echo   3) Start the AdHoc
echo   4) Stop the AdHoc
echo   5) Instructions
echo   6) Exit
echo.
set /p menuOption= Option: 
if [%menuOption%] == [] goto menu
goto %menuOption%

:1
cls
echo.
set /p ssid=Name for the network: 
set /p key=Password (min. char: 8): 
netsh wlan set hostednetwork mode=allow ssid="%ssid%" key="%key%"
echo.
pause
goto menu

:2
cls
netsh wlan show hostednetwork
echo.
pause
goto menu

:3
cls
netsh wlan start hostednetwork
echo.
pause
goto menu

:4
cls
netsh wlan stop hostednetwork
echo.
pause
goto menu

:5
cls
echo To share Internet: (with the AdHoc already created)
echo.
echo  1. Go to "Network and Sharing Center".
echo  2. On the top left: "Change adapter Settings".
echo  3. Select the interface that has Internet (advice: select "Ethernet").
echo  4. Right-Click, select: "Properties" (last option).
echo  5. Select the 2nd tab: "Sharing".
echo  6. Tick: "Allow other network users to connect ... connection".
echo     6.1 Below "Home networking connection:", select the AdHoc interface
echo       (usually "Local Area Connection *13")
echo  7. Congrats :)
echo.
echo  PS: If something didn't work well, email me - chinoman10 (at) msn.com
echo.
pause
goto menu
goto menu

:6
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
) else ( goto gotAdmin )

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

if [%1]==[] goto menu
goto %1
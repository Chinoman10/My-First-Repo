@echo off
color 0c
title Wireless Networks Manager - by Chinoman10

if [%1]==[] goto menu
goto %1

:menu
cls
echo.
echo          Main Menu
echo  ==========================
echo.
echo   1) Show all stored networks
echo   2) Show detailed info about one network
echo   3) Delete a network
echo   4) Exit
echo.
choice /c 1234 /n /m  "Option: "
goto %errorlevel%

:1
cls
echo.
netsh wlan show profiles
echo.
pause
goto menu

:2
set action=show
goto action

:3
set action=delete
goto action

:action
cls
echo.
set /p ssid= Name of the network: 
netsh wlan %action% profile "%ssid%"
echo.
if %errorlevel% EQU 1 (
	pause
	goto action
)
pause
goto menu

:4
exit
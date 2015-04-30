@echo off
color 0c
title Unturned Server Control Center
set _gamePath=F:\SteamLibrary\SteamApps\common\Unturned\Unturned.exe
set _options:-nographics -batchmode +secureserver/SvFolder

:start
cls
"%_gamePath% %_options%"
goto menu

:menu
echo.
echo.
echo.
set /p _pause= Server stopped! Press [Enter].
cls
echo ==================================
echo           Server stopped!
echo ==================================
echo.
echo.   1) Exit
echo.   2) Restart
echo.
choice /c 12 /n /m Opcao: 
if %errorlevel% EQU 1 exit
if %errorlevel% EQU 2 goto start

exit
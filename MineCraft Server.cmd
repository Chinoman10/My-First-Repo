@echo off
color 0c
set version=craftbukkit-1.7.9-R0.2.jar

:start1
cls
java -Xms2048m -Xmx2048m -jar "%version%"
goto menu

:menu
echo.
echo.
echo.
pause
cls
echo ==================================
echo         Servidor encerrou!
echo ==================================
echo.
echo.   1) Exit
echo.   2) Restart
echo.
choice /c 12 /n /m Opcao: 
if %errorlevel% EQU 1 exit
if %errorlevel% EQU 2 goto start1

exit
@echo off
title Shutdown Manager by Chinoman10
color 0c
set action=/s
set action2=shutdown
set timeInput=1
set timefr=3
set timeformat=hours
set multiplier=3600
goto intro

:intro
cls
echo.
echo        Shutdown Manager
echo       ==================
echo.
echo.
echo    1) Set countdown timer (current: %timeInput% %timeformat%)
echo    2) Select action (current: %action2%)
echo    3) Shutdown now!
echo    4) Abort current timer
echo.
set /p introChoice=Option: 
if %introChoice% LSS 1 goto intro
if %introChoice% GTR 4 goto intro
if defined introChoice (goto %introChoice%) else (goto intro)

:1
cls
echo.
echo          Shutdown Manager
echo         ==================
echo.
echo.
echo	 Set the time in what format?
echo.
echo	      1) Seconds
echo	      2) Minutes
echo	      3) Hours
echo.
set /p timefr= Time format: 
if %timefr% EQU 1 set multiplier=1
if %timefr% EQU 2 set multiplier=60
if %timefr% EQU 3 set multiplier=3600
if %timefr% LSS 1 goto 1
if %timefr% GTR 5 goto 1
if defined timefr (goto time) else (goto 1)

:time
if %timefr% EQU 1 set timeformat=seconds
if %timefr% EQU 2 set timeformat=minutes
if %timefr% EQU 3 set timeformat=hours
cls
echo.
echo          Shutdown Manager
echo         ==================
echo.
echo.
echo   In how much time would you like the
echo  computer to %action2%?
echo.
set /p timeInput= Time (%timeformat%): 
set /a time=%timeInput%*%multiplier%
shutdown %action% /t %time%
goto showtime

:showtime
cls
echo.
echo          Shutdown Manager
echo         ==================
echo.
echo.
echo    Your computer will %action2%
echo   in %timeInput% %timeformat%...
echo.
pause
goto intro

:2
cls
echo.
echo          Shutdown Manager
echo         ==================
echo.
echo.
echo    Choose action to perform:
echo.
echo   1) Shutdown
echo   2) Log off -not working-
echo   3) Restart PC
echo   4) Restart PC and opened applications
echo   5) Hibernate -not working-
echo.
set /p actionChoice= Choice: 
if %actionChoice% EQU 1 set action=/s
if %actionChoice% EQU 2 set action=/l
if %actionChoice% EQU 3 set action=/r
if %actionChoice% EQU 4 set action=/g
if %actionChoice% EQU 5 set action=/h

if %action% EQU /s set action2=shutdown
if %action% EQU /l set action2=log off
if %action% EQU /r set action2=restart PC
if %action% EQU /g set action2=restart PC and programs
if %action% EQU /h set action2=hibernate

if %actionChoice% LSS 1 goto 3
if %actionChoice% GTR 5 goto 3
if defined actionChoice (goto continue) else (goto 2)

:3
cls
shutdown /s /t 1
goto continue

:4
cls
shutdown /a
goto continue

:continue
cls
if %introChoice% EQU 2 set introChoice2=Action set: %action2%.
if %introChoice% EQU 3 set introChoice2=Shutting down...
if %introChoice% EQU 4 set introChoice2=Countdown aborted...
echo.
echo          Shutdown Manager
echo         ==================
echo.
echo.
echo    %introChoice2%
echo.
set /p pause= Press [Enter] to go back... 
goto intro
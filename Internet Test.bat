@echo off
color 0c
title Do I have Internet?

:1
color 0c	
echo Failed to ping...
ping -n 1 google.pt
cls
if %ERRORLEVEL% == 0 (
	color 0a
	echo You have internet!
	timeout /t 1 /nobreak
	cls
)
goto 1
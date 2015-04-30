@echo off
color 0c
set path="C:\Program Files\WinRAR\";%path%

FOR /f %%i IN ('dir /ad /b') do (
 cd %%i
 unrar x *
 del *.r*
 rmdir /s /q Sample
 cd..
)

pause
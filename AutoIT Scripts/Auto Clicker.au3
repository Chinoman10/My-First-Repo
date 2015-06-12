#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

HotKeySet("^!e", "myExit")
HotKeySet("!s", "start")

Global $bWaiting = False

intro()
start()

Func intro()
   TrayTip("Script Started","Press Alt+S to Start, Ctrl+Alt+E to Exit",10)
   Sleep(1500)
EndFunc

Func start()
   $bWaiting = Not $bWaiting

   if $bWaiting Then
	  TrayTip("Hotkey detected!", "Waiting... (Alt+S to Pause/Unpause)", 10)
   Else
	  TrayTip("Hotkey detected!", "Activated... (Ctrl+Alt+E to Exit)", 10)
   EndIf


   While True
	  if $bWaiting Then
		 Sleep(500)
	  Else
		 Local $aPos = MouseGetPos()
		 MouseClick("left", $aPos[0], $aPos[1], 2)
	  EndIf
   WEnd

EndFunc

Func myExit()
	Exit
EndFunc
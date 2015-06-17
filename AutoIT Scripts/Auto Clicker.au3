#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         Chinoman10

 Script Function:
	Spam Clicker

#ce ----------------------------------------------------------------------------

; ^ = Ctrl | ! = Alt
HotKeySet("^!e", "myExit")
HotKeySet("!s", "start")
HotKeySet("!t", "toggleTips")

; boolean Toggle for start/stop
Global $bWaiting = True
Global $bTipsOn = True

; integer value of Clicks/Second
Global $iClicksPerSecond = 100

intro()

Func intro()
   TrayTip("Script Started","Press Alt+S to Start, Ctrl+Alt+E to Exit",10)
	While True
		Sleep(9999999)	; Pause
	WEnd
EndFunc

Func start()
	$bWaiting = Not $bWaiting ; Invert Boolean value

	if $bWaiting Then
		If $bTipsOn Then
			TrayTip("Hotkey detected!", "Waiting... (Alt+S to Start/Stop)", 10)
		EndIf

		TraySetState(8)
	Else
		If $bTipsOn Then
			TrayTip("Hotkey detected!", "Activated... (Ctrl+Alt+E to Exit)", 10)
		EndIf
		TraySetState(4)
	EndIf


	While True
		if $bWaiting Then
			Sleep(500)
		Else
			Local $aPos = MouseGetPos()
			MouseClick("left", $aPos[0], $aPos[1], 2)
			Sleep(1000 / $iClicksPerSecond) ; 1 second divided by # of Clicks/Second
		EndIf
	WEnd

EndFunc

Func toggleTips()
	$bTipsOn = Not $bTipsOn
EndFunc

Func myExit()
	Exit
EndFunc
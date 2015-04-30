#include <Constants.au3>

Local $cShortcutChar

Func _Input()
   $cShortcutChar = InputBox("Custom Shortcut", "Please type the letter you want to use" & @CRLF & "as a shortcut with CTRL")
EndFunc

_Input()
While StringLen($cShortcutChar) > 1
   MsgBox($MB_SYSTEMMODAL, "Error!", "Please type only 1 character")
   _Input()
WEnd

AutoItSetOption("WinTitleMatchMode", 2) ; Set WinActivate Partial Name matching, instead of from Start (default)
WinActivate("Notepad")
WinWaitActive("Notepad")

Send("^" & $cShortcutChar)
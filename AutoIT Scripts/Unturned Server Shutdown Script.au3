#include <Constants.au3>

Local $sServerTitle = "[PT/Eng] Survival PvP | Normal | Tuga Power!"


MsgBox($MB_OK, "Script Executed!", "This computer will shutdown in 1 hour!", 5)

WinActivate($sServerTitle)

WinWaitActive($sServerTitle)

Send("say [Auto] Saving...",1)
Send("{ENTER}")
Send("save{ENTER}")

Send("say [Auto] Server will shutdown in 1 hour.",1)
Send("{ENTER}")
sleep(1800000) ; Sleep 30m

WinActivate($sServerTitle)
Send("say [Auto] Server will shutdown in 30 minutes.",1)
Send("{ENTER}")
sleep(900000) ; Sleep 15m

WinActivate($sServerTitle)
Send("say [Auto] Server will shutdown in 15 minutes.",1)
Send("{ENTER}")
sleep(600000) ; Sleep 10m

WinActivate($sServerTitle)
Send("say [Auto] Server will shutdown in 5 minutes.",1)
Send("{ENTER}")
sleep(60000) ; Sleep 1m

WinActivate($sServerTitle)
Send("say [Auto] Server will shutdown in 4 minutes.",1)
Send("{ENTER}")
sleep(60000) ; Sleep 1m

WinActivate($sServerTitle)
Send("say [Auto] Server will shutdown in 3 minutes.",1)
Send("{ENTER}")
sleep(60000) ; Sleep 1m

WinActivate($sServerTitle)
Send("say [Auto] Server will shutdown in 2 minutes.",1)
Send("{ENTER}")
sleep(60000) ; Sleep 1m

WinActivate($sServerTitle)
Send("say [Auto] Server will shutdown in 1 minute.",1)
Send("{ENTER}")
sleep(30000) ; Sleep 30s

WinActivate($sServerTitle)
Send("say [Auto] Server will shutdown in 30 seconds.",1)
Send("{ENTER}")
sleep(20000) ; Sleep 20s

WinActivate($sServerTitle)
Send("say [Auto] Server will shutdown in 10 seconds!!!",1)
Send("{ENTER}")
sleep(5000) ; Sleep 5s

WinActivate($sServerTitle)
Send("say [Auto] 5...",1)
Send("{ENTER}")
sleep(1000) ; Sleep 1s

WinActivate($sServerTitle)
Send("say [Auto] 4...",1)
Send("{ENTER}")
sleep(1000) ; Sleep 1s

WinActivate($sServerTitle)
Send("say [Auto] 3...",1)
Send("{ENTER}")
sleep(1000) ; Sleep 1s

WinActivate($sServerTitle)
Send("say [Auto] 2...",1)
Send("{ENTER}")
sleep(1000) ; Sleep 1s

WinActivate($sServerTitle)
Send("say [Auto] 1...",1)
Send("{ENTER}")
sleep(1000) ; Sleep 1s

WinActivate($sServerTitle)
Send("say [Auto] Saving...",1)
Send("save{ENTER}")
sleep(2000)
Send("shutdown{ENTER}")

WinWaitClose($sServerTitle)

; Force Shutdown (4+1)
shutdown(5)
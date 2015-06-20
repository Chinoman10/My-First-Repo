#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         Chinoman10

 Script Function:
	Disable useless Local Area Connection interfaces.

#ce ----------------------------------------------------------------------------
#include <Array.au3>
#include <AutoItConstants.au3>

#RequireAdmin

Start()

Func Start()

	Local $sFileName = 'output.txt'
	Local $sCommand = 'netsh interface show interface'
	Local $iPID = Run (@ComSpec & ' /C ' & $sCommand & ' > ' & $sFileName, @ScriptDir, @SW_HIDE)
	ProcessWaitClose($iPID)

	Local $sOutput = FileRead($sFileName)
	FileDelete($sFileName)

	Local $aArray = StringSplit(StringTrimRight(StringStripCR($sOutput), StringLen(@CRLF)), @CRLF)
	_ArrayDelete($aArray, "0-1")
	_ArrayDelete($aArray, "1")
	Local $aArray2 = ConvertArray1Dto2D($aArray)

	If @error Then
       MsgBox($MB_SYSTEMMODAL, "", "It appears there was an error.")
	Else
        ; Display the results.
		$sTitle = $aArray2[0][0]
		For $i = 1 To UBound($aArray2,2)-1
			$sTitle &= '|' & $aArray2[0][$i]
		Next
;		_ArrayDisplay($aArray2, 'Output', "1:99", 32+64, Default, $sTitle)
	EndIf

	ShutdownInterfaces($aArray2)
EndFunc


Func ShutdownInterfaces($aArray2)

;	netsh interface set interface name="Local Area Connection 2" admin=DISABLED
	For $i = 1 To UBound($aArray2)
		Local $sInterfaceName = $aArray2[$i][3]

		if StringRegExp($sInterfaceName, "Local Area Connection") And StringRegExp($aArray2[$i][0], "Enabled") Then
;			MsgBox($MB_SYSTEMMODAL, "Shuting down Interface", $sInterfaceName)
			Local $sCommand = 'netsh interface set interface name="' & $sInterfaceName & '" admin=disabled'

			Local $iPID = Run ( @ComSpec & ' /C  ' & $sCommand ,'',@SW_HIDE)
		;	ProcessWaitClose($iPID)

		EndIf
	Next

	Exit

EndFunc

Func ConvertArray1Dto2D($aArray)
	Dim $aArray2[UBound($aArray)][4]

	For $i = 0 To UBound($aArray)-1
		$sTemp = StringRegExpReplace($aArray[$i], ' {2,20}', ',')

		$aSplitted = StringSplit($sTemp, ',')

		For $j = 1 To UBound($aSplitted)-1
			$aArray2[$i][$j-1] = $aSplitted[$j]
		Next
	Next

;	_ArrayDisplay($aArray2)

	Return $aArray2
EndFunc
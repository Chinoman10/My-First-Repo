#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         Chinoman10

 Script Function:
	Auto Login on websites.

#ce ----------------------------------------------------------------------------

#include <IE.au3>

redditLogin()

Func redditLogin()

	Global $oReddit = _IECreate( "reddit.com" )

	Local $oUser = _IEGetObjByName ( $oReddit, "user" )
	Local $oPass = _IEGetObjByName ( $oReddit, "passwd" )

	_IEFormElementSetValue( $oUser, "your username" )
	_IEFormElementSetValue( $oPass, "password" )

	For $tag in $oReddit.document.GetElementsByTagName("button")
		if $tag.className = "btn" Then
			_IEAction( $tag, "click" )
			ExitLoop
		EndIf
	Next


EndFunc

Func g2aLogin()
	Global $oG2A = _IECreate( "g2a.com" )
	_IELoadWait($oG2A)

	Local $o1 = _IEGetObjById( $oG2A, "loginLink" )
	_IEAction ( $o1 , "click" )
	Local $o2 = _IEGetObjById( $oG2A, "tmp_login_form" )
	_IEAction ( $o2 , "click" )

	Local $oUsername = _IEGetObjById( $oG2A, "login_social" )
	Local $oPassword = _IEGetObjById( $oG2A, "password_social2" )
	Local $oButton = _IEGetObjByName( $oG2A, "socials_a_type" )

	_IEFormElementSetValue($oUsername, "chinoman10@msn.com")
	_IEFormElementSetValue($oPassword, "asdasd")

	_IEAction( $oButton, "click" )
EndFunc
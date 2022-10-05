#cs ----------------------------------------------------------------------------

 Learn It with PHAMDUCDAT
 AUTOIT 2022
 Author:         Venus

 Script Function:
	Template AutoIt script.

#ce -----------------------------------------------------------------------
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Global $Form1_1 = GUICreate("Memberlogin", 533, 263, -1, -1)
Global $Segoe = GUICtrlCreateLabel("Segoe", 2654, 72, 60, 28)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
Global $Label1 = GUICtrlCreateLabel("Username", 32, 32, 91, 28)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
Global $input1 = GUICtrlCreateInput("", 136, 32, 353, 21)
Global $Label2 = GUICtrlCreateLabel("Password", 32, 80, 86, 28)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
Global $input2 = GUICtrlCreateInput("", 136, 80, 353, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_PASSWORD))
Global $Login = GUICtrlCreateButton("Login", 136, 128, 355, 33, $BS_DEFPUSHBUTTON)
GUICtrlSetCursor(-1,0)
Global $Button1 = GUICtrlCreateButton("Exit", 136, 176, 355, 25)
GUICtrlSetCursor(-1,0)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Login
			Local $username = GUICtrlRead($input1)
			Local $password = GUICtrlRead($input2)
			If $username == 'Admin' And $password == '111111' Then
				MsgBox(64 + 262144,'Thông báo', 'Bạn đã đăng nhập thành công')
			Else
				MsgBox(16 + 262144,'Thông báo', 'Tên người dùng hoặc mật khẩu không chính xác')
			EndIf
		Case $Button1
			Exit
	EndSwitch
WEnd

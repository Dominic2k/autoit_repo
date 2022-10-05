#cs ----------------------------------------------------------------------------
 Learn AutoIt - by JUNO_OKYO
 From J2TEAM with love!!!
#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#Region
#AutoIt3Wrapper_Icon=shutdown.ico
#EndRegion

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <DateTimeConstants.au3> ; form Time Picker
#include <Date.au3>

#Region ### START Koda GUI section ### Form=
Global $FormMain = GUICreate("Auto Shutdown", 443, 445, -1, -1)
GUISetFont(14, 400, 0, "Segoe UI")
Global $LabelSelectAction = GUICtrlCreateLabel("Select action:", 16, 16, 115, 29)
Global $ComboSelectAction = GUICtrlCreateCombo("", 16, 48, 169, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Shutdown|Restart", 'Shutdown')
Global $CheckboxForceClose = GUICtrlCreateCheckbox("Force running applications to close", 16, 96, 329, 41)
Global $CheckboxTimeout = GUICtrlCreateCheckbox("Set the time-out period before shutdown", 16, 144, 409, 33)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $LabelTimeout = GUICtrlCreateLabel("Time-out", 16, 192, 81, 29)
Global $InputTimeout = GUICtrlCreateInput("30", 112, 192, 89, 33, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_NUMBER))
Global $LabelSecond = GUICtrlCreateLabel("Seconds", 216, 192, 74, 29)
Global $ButtonTimePicker = GUICtrlCreateButton("Time Picker", 312, 192, 115, 33)
Global $LabelComment = GUICtrlCreateLabel("Comment:", 16, 240, 90, 29)
Global $EditComment = GUICtrlCreateEdit("", 16, 280, 409, 89)
Global $ButtonStart = GUICtrlCreateButton("Start", 16, 392, 195, 33)
Global $ButtonAbort = GUICtrlCreateButton("Abort", 232, 392, 195, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

#Region ### START Koda GUI section ### Form=
Global $FormTimePicker = GUICreate("Select Time", 291, 127, -1, -1, -1, -1, $FormMain)
GUISetFont(14, 400, 0, "Segoe UI")
Global $DateTimePicker = GUICtrlCreateDate("", 16, 16, 258, 33, BitOR($DTS_UPDOWN,$DTS_TIMEFORMAT))

;Local $sStyle = "yyyy/MM/dd HH:mm:ss"
Global $sStyle = "yyyy/MM/dd HH:mm:ss"
GUICtrlSendMsg($DateTimePicker, $DTM_SETFORMATW, 0, $sStyle)

Global $ButtonOK = GUICtrlCreateButton("OK", 16, 72, 259, 33)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg(1) ; b?t ch? d? nâng cao
	Switch $nMsg[0]
		Case $GUI_EVENT_CLOSE
			If $nMsg[1] == $FormMain Then
				Exit
			EndIf

			If $nMsg[1] == $FormTimePicker Then
				GUISetState(@SW_HIDE, $FormTimePicker)
			EndIf

		Case $CheckboxTimeout
			; Ch? khi checkbox du?c tích: cho phép nh?p timeout
			If GUICtrlRead($CheckboxTimeout) == $GUI_CHECKED Then
				toggleTimeout(True)
			Else
				toggleTimeout(False)
			EndIf

		Case $ButtonTimePicker
			GUISetState(@SW_SHOW, $FormTimePicker)

		Case $ButtonStart
			Run(generateCommand(), '', @SW_HIDE)

		Case $ButtonAbort
			Run('shutdown -a', '', @SW_HIDE)
			MsgBox(64 + 262144, 'Thông báo', 'Ðã h?y thành công!')

		Case $ButtonOK
			Local $dateTime = GUICtrlRead($DateTimePicker)

			$dateTime = StringReplace($dateTime, ' PM', '')
			$dateTime = StringReplace($dateTime, ' AM', '')

			Local $seconds = _DateDiff('s', _NowCalc(), $dateTime)

			If $seconds <= 0 Then
				MsgBox(16 + 262144, 'L?i', 'Vui lòng ch?n m?t th?i gian h?p l?!')
			Else
				GUICtrlSetData($InputTimeout, $seconds)
				GUISetState(@SW_HIDE, $FormTimePicker)
			EndIf
	EndSwitch
WEnd

Func generateCommand()
	Local $cmd = 'shutdown'

	; ki?m tra các tùy ch?n c?a ngu?i dùng

	; shutdown hay restart
	Local $action = GUICtrlRead($ComboSelectAction)
	$cmd &= ' ' & ($action == 'Shutdown' ? '-s' : '-r')

	; có dóng toàn b? ?ng d?ng hay không?
	If GUICtrlRead($CheckboxForceClose) == $GUI_CHECKED Then
		$cmd &= ' -f'
	EndIf

	; có d?t th?i gian ch? hay không?
	If GUICtrlRead($CheckboxTimeout) == $GUI_CHECKED Then
		Local $timeout = GUICtrlRead($InputTimeout)

		If Not $timeout Then
			$timeout = 30
			GUICtrlSetData($InputTimeout, 30)
		EndIf

		$cmd &= ' -t ' & $timeout
	EndIf

	; có nh?p l?i nh?n gì không?
	Local $comment = GUICtrlRead($EditComment)

	If $comment Then
		$cmd &= ' -c "' & $comment & '"'
	EndIf

	Return $cmd
EndFunc

Func toggleTimeout($enabled)
	Local $value = $enabled ? $GUI_ENABLE : $GUI_DISABLE

	GUICtrlSetState($LabelTimeout, $value)
	GUICtrlSetState($InputTimeout, $value)
	GUICtrlSetState($LabelSecond, $value)
	GUICtrlSetState($ButtonTimePicker, $value)

	If $value Then
		GUICtrlSetState($InputTimeout, $GUI_FOCUS)
	EndIf
EndFunc
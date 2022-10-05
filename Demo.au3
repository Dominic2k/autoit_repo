#cs ----------------------------------------------------------------------------
 Learn AutoIt - by JUNO_OKYO
 From J2TEAM with love!!!
#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

; ghi d? li?u ra file
;~ Global $filePath = FileSaveDialog('Save', @ScriptDir, 'Plain text (*.txt)|AutoIt (*.au3)|All files (*.*)', 16, 'macro.txt')
;~ Global $fileHandle = FileOpen($filePath, 2 + 8 + 128)
;~ FileWrite($fileHandle, 'Hello')
;~ FileClose($fileHandle)

; d?c d? li?u
;~ Global $filePath = FileOpenDialog('Open', @ScriptDir, 'Plain text (*.txt)|All files (*.*)', 1 + 2 + 8, 'macro.txt')
;~ Global $fileHandle = FileOpen($filePath, 128)
;~ Global $data = FileRead($fileHandle)
;~ FileClose($fileHandle)
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <File.au3>

#Region ### START Koda GUI section ### Form=
Global $FormMain = GUICreate("Untitled - Notepad", 582, 404, -1, -1, BitOR($GUI_SS_DEFAULT_GUI,$WS_MAXIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_TABSTOP))
Global $MenuItem1 = GUICtrlCreateMenu("&File")
Global $MenuItem3 = GUICtrlCreateMenuItem("&New", $MenuItem1)
Global $MenuItem4 = GUICtrlCreateMenuItem("&Open", $MenuItem1)
Global $MenuItem5 = GUICtrlCreateMenuItem("&Save", $MenuItem1)
Global $MenuItem6 = GUICtrlCreateMenuItem("", $MenuItem1)
Global $MenuItem7 = GUICtrlCreateMenuItem("E&xit", $MenuItem1)
Global $MenuItem2 = GUICtrlCreateMenu("&Help")
Global $MenuItem8 = GUICtrlCreateMenuItem("&About", $MenuItem2)
GUISetFont(14, 400, 0, "Segoe UI")
Global $Edit1 = GUICtrlCreateEdit("", 0, 0, 614, 416)
GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
Global $FormMain_AccelTable[1][2] = [["!+{F21}", $MenuItem8]]
GUISetAccelerators($FormMain_AccelTable)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $MenuItem3 ; New
			; N?u kh�ng c� d? li?u: th� kh�ng l�m g�
			; N?u c� d? li?u: h?i ngu?i d�ng c� mu?n luu l?i kh�ng
			; - N?u kh�ng luu: x�a d? li?u trong Edit
			; - N?u c� luu: luu l?i v� x�a d? li?u trong Edit
			Local $content = GUICtrlRead($Edit1)

			If $content Then
				Local $action = MsgBox(3 + 262144, 'Notepad', 'Do you want to save changes to Untitled?', 0, $FormMain)

				If $action == 6 Or $action == 7 Then
					; Luu file
					If $action == 6 Then
						saveFile($content)
					EndIf

					; x�a d? li?u
					GUICtrlSetData($Edit1, '')
				EndIf
			EndIf

		Case $MenuItem4 ; Open
			; N?u kh�ng c� d? li?u: th� hi?n th? h?p tho?i m? file
			; N?u c� d? li?u: h?i ngu?i d�ng c� mu?n luu l?i kh�ng
			; - N?u kh�ng luu: hi?n th? h?p tho?i m? file
			; - N?u c� luu: luu l?i v� hi?n th? h?p tho?i m? file
			Local $content = GUICtrlRead($Edit1)

			If $content Then
				; c� d? li?u
				saveFile($content)
			EndIf

			Local $filePath = openFile()

			updateTitle($filePath)

		Case $MenuItem5 ; Save
			; H?i ngu?i d�ng c� mu?n luu file kh�ng
			Local $content = GUICtrlRead($Edit1)

			If $content Then
				Local $filePath = saveFile($content)
				updateTitle($filePath)
			EndIf

		Case $MenuItem7
			Exit

		Case $MenuItem8 ; About
			MsgBox(64 + 262144, 'About', 'Developed by JUNO_OKYO', 0, $FormMain)

	EndSwitch
WEnd

Func saveFile($content)
	Local $fileHandle = FileSaveDialog('Save', @ScriptDir, 'Text files (*.txt)|All files (*.*)', 16, '', $FormMain)

	If $fileHandle Then
		Local $filePath = FileOpen($fileHandle, 2)
		FileWrite($filePath, $content)
		FileClose($filePath)

		Return $fileHandle
	EndIf
EndFunc

Func openFile()
	Local $fileHandle = FileOpenDialog('Open', @ScriptDir, 'Text files (*.txt)|All files (*.*)', 1 + 2 + 8, '', $FormMain)

	If $fileHandle Then
		Local $filePath = FileOpen($fileHandle, 128)
		Local $data = FileRead($filePath)
		FileClose($filePath)

		GUICtrlSetData($Edit1, $data)

		Return $fileHandle
	EndIf
EndFunc

Func updateTitle($filePath)
	Local $drive, $dir, $fileName, $fileExt
	_PathSplit($filePath, $drive, $dir, $fileName, $fileExt)

	WinSetTitle($FormMain, '', $fileName & $fileExt & ' - Notepad')
EndFunc
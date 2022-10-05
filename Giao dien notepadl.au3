#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Global $Notepad = GUICreate("Untitled - Notepad", 581, 369, 381, 124, BitOR($GUI_SS_DEFAULT_GUI,$WS_MAXIMIZEBOX,$WS_SIZEBOX,$WS_THICKFRAME,$WS_TABSTOP))
Global $MenuItem1 = GUICtrlCreateMenu("&File")
Global $MenuItem2 = GUICtrlCreateMenuItem("New"&@TAB&"Ctrl+N", $MenuItem1)
Global $MenuItem8 = GUICtrlCreateMenuItem("New Window"&@TAB&"Ctrl+Shift+N", $MenuItem1)
Global $MenuItem5 = GUICtrlCreateMenuItem("Open"&@TAB&"Ctrl+O", $MenuItem1)
Global $MenuItem4 = GUICtrlCreateMenuItem("Save", $MenuItem1)
Global $MenuItem6 = GUICtrlCreateMenuItem("Save As..."&@TAB&"", $MenuItem1)
Global $MenuItem7 = GUICtrlCreateMenuItem("Exit", $MenuItem1)
Global $MenuItem29 = GUICtrlCreateMenuItem("", $MenuItem1)
Global $MenuItem9 = GUICtrlCreateMenu("&Edit")
Global $MenuItem13 = GUICtrlCreateMenuItem("Undo", $MenuItem9)
Global $MenuItem14 = GUICtrlCreateMenuItem("Cut", $MenuItem9)
Global $MenuItem15 = GUICtrlCreateMenuItem("Copy", $MenuItem9)
Global $MenuItem16 = GUICtrlCreateMenuItem("Paste", $MenuItem9)
Global $MenuItem17 = GUICtrlCreateMenuItem("Delete"&@TAB&"", $MenuItem9)
Global $MenuItem18 = GUICtrlCreateMenuItem("", $MenuItem9)
Global $MenuItem10 = GUICtrlCreateMenu("F&ormat")
Global $MenuItem19 = GUICtrlCreateMenuItem("Word Wrap"&@TAB&"", $MenuItem10)
Global $MenuItem20 = GUICtrlCreateMenuItem("Font...", $MenuItem10)
Global $MenuItem26 = GUICtrlCreateMenuItem("", $MenuItem10)
Global $MenuItem11 = GUICtrlCreateMenu("&View")
Global $MenuItem21 = GUICtrlCreateMenuItem("Zoom"&@TAB&"", $MenuItem11)
Global $MenuItem22 = GUICtrlCreateMenuItem("Status Bar", $MenuItem11)
Global $MenuItem27 = GUICtrlCreateMenuItem(""&@TAB&"", $MenuItem11)
Global $MenuItem12 = GUICtrlCreateMenu("&Help")
Global $MenuItem23 = GUICtrlCreateMenuItem("View Help"&@TAB&"", $MenuItem12)
Global $MenuItem24 = GUICtrlCreateMenuItem("Sent Feedback"&@TAB&"", $MenuItem12)
Global $MenuItem25 = GUICtrlCreateMenuItem("About Notepad"&@TAB&"", $MenuItem12)
Global $MenuItem28 = GUICtrlCreateMenuItem("", $MenuItem12)
GUISetFont(16, 400, 0, "Segoe UI")
Global $Edit1 = GUICtrlCreateEdit("", 0, 0, 597, 394)
GUICtrlSetData(-1, "")
Global $Notepad_AccelTable[6][2] = [["!t", $MenuItem2],["!+{NUM 5}", $MenuItem21],["{CAPS LOCK}", $MenuItem27],["!+0", $MenuItem23],["!{SPACE}", $MenuItem24],["{CAPS LOCK}", $MenuItem25]]
GUISetAccelerators($Notepad_AccelTable)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $MenuItem2 ;New
			Local $content = GUICtrlRead($Edit1)
			If $content Then
				Local $fp = FileSaveDialog('Save', @ScriptDir,'Text files (*.txt)|All (*.*)', 2+16, '',$Notepad)
				If $fp Then
					FileWrite($fp, $content)
					FileClose($fp)

					MsgBox(0,0,'Đã lưu thành công')
					GUICtrlSetData($Edit1,'')
				EndIf
			EndIf
		Case $MenuItem5 ;Open
		Case $MenuItem4 ;Save
			Exit
		Case $MenuItem25
			MsgBox(64 + 262144, 'About', 'Developed by Phạm Đức Đạt|Venus')
	EndSwitch
WEnd

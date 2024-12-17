#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <MsgBoxConstants.au3>
#include <GUIEdit.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
DirCreate(@TempDir & "\res")
FileInstall("res\msgboxgen.ico", @TempDir & "\res\msgboxgen.ico", 1)
FileInstall("res\cr.ico", @TempDir & "\res\cr.ico", 1)
FileInstall("res\ex.ico", @TempDir & "\res\ex.ico", 1)
FileInstall("res\qu.ico", @TempDir & "\res\qu.ico", 1)
FileInstall("res\in.ico", @TempDir & "\res\in.ico", 1)
DllCall("UxTheme.dll", "none", "SetThemeAppProperties", "int", 1)
#Region ### START Koda GUI section ### Form=C:\Users\Gebruiker\Desktop\msgboxgen.kxf
$Form1 = GUICreate("Messagebox Generator for VBScript", 361, 343, -1, -1)
GUISetIcon(@TempDir & "\res\msgboxgen.ico", -1)
If FileExists(@TempDir & "\res\msgboxgen.ico") = False Then
	Msgbox(48, "Icon error", "Icon file not found! To apply an icon, make an icon with the name ""msgboxgen.ico"" at " & @TempDir & "\res\msgboxgen.ico")
EndIf
$title = GUICtrlCreateGroup("Title", 7, 0, 346, 43)
$ttl = GUICtrlCreateInput("", 14, 14, 331, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group1 = GUICtrlCreateGroup("Icon", 7, 111, 122, 153)
$RadioN = GUICtrlCreateRadio("None", 14, 126, 53, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$RadioCr = GUICtrlCreateRadio("Critical", 14, 152, 50, 17)
$RadioQu = GUICtrlCreateRadio("Question", 14, 180, 60, 17)
$RadioEx = GUICtrlCreateRadio("Exclamation", 14, 208, 74, 17)
$RadioIn = GUICtrlCreateRadio("Information", 14, 236, 71, 17)
$Icon4 = GUICtrlCreateIcon(@TempDir & "\res\in.ico", -1, 91, 232, 25, 25)
$Icon2 = GUICtrlCreateIcon(@TempDir & "\res\ex.ico", -1, 91, 203, 27, 27)
$Icon3 = GUICtrlCreateIcon(@TempDir & "\res\qu.ico", -1, 91, 177, 25, 25)
$Icon1 = GUICtrlCreateIcon(@TempDir & "\res\cr.ico", -1, 91, 149, 25, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("Buttons", 133, 111, 220, 153)
$RadioOK = GUICtrlCreateRadio("OK", 140, 125, 103, 23, BitOR($GUI_SS_DEFAULT_RADIO,$BS_PUSHLIKE))
GUICtrlSetState(-1, $GUI_CHECKED)
$RadioOKC = GUICtrlCreateRadio("OK, Cancel", 245, 125, 103, 23, BitOR($GUI_SS_DEFAULT_RADIO,$BS_PUSHLIKE))
$RadioYNC = GUICtrlCreateRadio("Yes, No, Cancel", 140, 153, 208, 23, BitOR($GUI_SS_DEFAULT_RADIO,$BS_PUSHLIKE))
$RadioYN = GUICtrlCreateRadio("Yes, No", 140, 179, 208, 23, BitOR($GUI_SS_DEFAULT_RADIO,$BS_PUSHLIKE))
$RadioARI = GUICtrlCreateRadio("Abort, Retry, Ignore", 140, 206, 208, 23, BitOR($GUI_SS_DEFAULT_RADIO,$BS_PUSHLIKE))
$RadioRC = GUICtrlCreateRadio("Retry, Cancel", 140, 233, 208, 23, BitOR($GUI_SS_DEFAULT_RADIO,$BS_PUSHLIKE))
GUICtrlCreateGroup("", -99, -99, 1, 1)
$test = GUICtrlCreateButton("&Test", 6, 270, 75, 23, $BS_DEFPUSHBUTTON  )
$codeout = GUICtrlCreateInput("", 12, 309, 275, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_READONLY))
$codemake = GUICtrlCreateButton("&Generate Code", 84, 270, 99, 23)
$about = GUICtrlCreateButton("&About...", 276, 270, 75, 23)
$reset = GUICtrlCreateButton("&Reset", 186, 270, 87, 23)
$Group3 = GUICtrlCreateGroup("Code", 6, 294, 346, 43)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Text = GUICtrlCreateGroup("Text", 7, 42, 346, 69)
$msg = GUICtrlCreateEdit("", 12, 56, 335, 47, BitOR($ES_AUTOVSCROLL,$WS_VSCROLL))
$save = GUICtrlCreateButton("&Save...", 293, 307, 50, 23)
GUICtrlCreateGroup("", -99, -99, 1, 1)
DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGethandle($msg), "wstr", 0, "wstr", 0)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
			DirRemove(@Tempdir & "\res", 1)
		
		
		Case $test
			Dim $iconl
			If GUICtrlRead($RadioN) = $GUI_CHECKED Then
				Local $iconl = 0
			EndIf
			If GUICtrlRead($RadioCr) = $GUI_CHECKED Then
				Local $iconl = 16
			EndIf
			If GUICtrlRead($RadioQu) = $GUI_CHECKED Then
				Local $iconl = 32
			EndIf
			If GUICtrlRead($RadioEx) = $GUI_CHECKED Then
				Local $iconl = 48
			EndIf
			If GUICtrlRead($RadioIn) = $GUI_CHECKED Then
				Local $iconl = 64
			EndIf
			
			Dim $radiol
			If GUICtrlRead($RadioOK) = $GUI_CHECKED Then
				$radiol = 0
			EndIf
			If GUICtrlRead($RadioOKC) = $GUI_CHECKED Then
				$radiol = 1
			EndIf
			If GUICtrlRead($RadioARI) = $GUI_CHECKED Then
				$radiol = 2
			EndIf
			If GUICtrlRead($RadioYNC) = $GUI_CHECKED Then
				$radiol = 3
			EndIf
			If GUICtrlRead($RadioYN) = $GUI_CHECKED Then
				$radiol = 4
			EndIf
			If GUICtrlRead($RadioRC) = $GUI_CHECKED Then
				$radiol = 5
			EndIf			
			
			Msgbox($iconl + $radiol, GUICtrlRead($ttl), GUICtrlRead($msg))
		
	Case $about
		Msgbox(64+$MB_TASKMODAL, "About", "Made by PixelGamer2!")
		
	Case $codemake
		If GUICtrlRead($RadioN) = $GUI_CHECKED Then
			Local $iconw = "0"
		EndIf
		If GUICtrlRead($RadioCr) = $GUI_CHECKED Then
			Local $iconw = "16"
		EndIf
		If GUICtrlRead($RadioQu) = $GUI_CHECKED Then
			Local $iconw = "32"
		EndIf
		If GUICtrlRead($RadioEx) = $GUI_CHECKED Then
			Local $iconw = "48"
		EndIf
		If GUICtrlRead($RadioIn) = $GUI_CHECKED Then
			Local $iconw = "64"
		EndIf
		
		
		Dim $radiow
		If GUICtrlRead($RadioOK) = $GUI_CHECKED Then
			$radiow = "0"
		EndIf
		If GUICtrlRead($RadioOKC) = $GUI_CHECKED Then
			$radiow = "1"
		EndIf
		If GUICtrlRead($RadioARI) = $GUI_CHECKED Then
			$radiow = "2"
		EndIf
		If GUICtrlRead($RadioYNC) = $GUI_CHECKED Then
			$radiow = "3"
		EndIf
		If GUICtrlRead($RadioYN) = $GUI_CHECKED Then
			$radiow = "4"
		EndIf
		If GUICtrlRead($RadioRC) = $GUI_CHECKED Then
			$radiow = "5"
		EndIf
		
		$codee = "Msgbox """ & GUICtrlRead($msg) & """ ," & $radiow & "+" & $iconw & ", """ & GUICtrlRead($ttl) & """"
		GUICtrlSetData($codeout, $codee)

	Case $reset 
		GUICtrlSetData($msg, "")
		GUICtrlSetData($ttl, "")
		GUICtrlSetData($codeout, "")
		GUICtrlSetState($RadioN, $GUI_CHECKED)
		GUICtrlSetState($RadioOK, $GUI_CHECKED)
		
	Case $save
		$savefile = FileSaveDialog("Save code", @ScriptDir, "Visual Basic Script (*.vbs)|Text File (*.txt)", BitOR(2, 16))
		FileWrite($savefile, GUICtrlRead($codeout))
		If $savefile = "" Then
			Break(0)
		Else
			Msgbox(64, "Succes", "File saved succesfully")
		EndIf
	EndSwitch
WEnd


; iTunes/Spotify Anywhere
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:		 uvcyclotron <twitter.com/uvcyclotron>
; Inspired from 'iTunes Anywhere' by Polyphenol <myemail@nowhere.com>
;
; Script Function:
;   Control iTunes/Spotify from anywhere with hotkeys
;


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#NoTrayIcon		;obv
#SingleInstance force	;relods the script. diff if use 'ignore', which ignores new runs
DetectHiddenWindows, on
EnvSet, %ProgramFilesx86% , 'C:\Program Files (x86)'

#\::
IfWinNotExist, ahk_class iTunes
{
Run C:\Program Files (x86)\iTunes\iTunes.exe  ;launch program
return
}

IfWinExist, ahk_class iTunes ; toggle minimize/restore
{
IfWinNotActive ; restores window
WinActivate
Else
WinMinimize ; minimizes windows
return
}

#+\::		
ExitApp				;End the hotkey script

#.::
IfWinExist, ahk_class iTunes
{
ControlSend, ahk_parent, ^{RIGHT}  ; > next
return
}

IfWinExist, ahk_class SpotifyMainWindow
{
ControlSend, ahk_parent, ^{RIGHT}  ; > next
return
}

#,::
IfWinExist, ahk_class iTunes
{
ControlSend, ahk_parent, ^{LEFT}  ; < previous
return
}

IfWinExist, ahk_class SpotifyMainWindow
{
ControlSend, ahk_parent, ^{LEFT}  ; < previous
return
}

#+.::
IfWinExist, ahk_class iTunes
{
ControlSend, ahk_parent, ^{SPACE}  ; Genius Shuffle
return
}

#/::
IfWinExist, ahk_class iTunes
{
ControlSend, ahk_parent, {SPACE}  ; play/pause toggle
return
}

IfWinExist, ahk_class SpotifyMainWindow
{
ControlSend, ahk_parent, {SPACE}  ; play/pause toggle
return
}

#;::
IfWinExist, ahk_class iTunes
{
ControlSend, ahk_parent, ^{UP}  ; vol up
return
}

IfWinExist, ahk_class SpotifyMainWindow
{
ControlSend, ahk_parent, ^{UP}  ; vol up
return
}

#'::
IfWinExist, ahk_class iTunes
{
ControlSend, ahk_parent, ^{DOWN}  ; vol down
return
}

IfWinExist, ahk_class SpotifyMainWindow
{
ControlSend, ahk_parent, ^{DOWN}  ; vol down
return
}

#=::
SetTimer, songpreview, 10000 ; change song every 10 sec
songpreview:
IfWinExist, ahk_class iTunes
{
ControlSend, ahk_parent, ^{RIGHT}
return
}

IfWinExist, ahk_class SpotifyMainWindow
{
ControlSend, ahk_parent, ^{RIGHT}
return
}

#-::
SetTimer, songpreview, Off
return

;;one-handed operation: ctrl+properties key. then usual hotkey modifier.
^SC15D::
Input Key, L1
if Key=/
{
IfWinExist, ahk_class iTunes
{
ControlSend, ahk_parent, {SPACE}  ; play/pause toggle
return
}

IfWinExist, ahk_class SpotifyMainWindow
{
ControlSend, ahk_parent, {SPACE}  ; play/pause toggle
return
}
}

if Key=,
{
IfWinExist, ahk_class iTunes
{
ControlSend, ahk_parent, ^{LEFT}  ; < previous
return
}

IfWinExist, ahk_class SpotifyMainWindow
{
ControlSend, ahk_parent, ^{LEFT}  ; < previous
return
}
}

if Key=.
{
IfWinExist, ahk_class iTunes
{
ControlSend, ahk_parent, ^{RIGHT}  ; > next
return
}

IfWinExist, ahk_class SpotifyMainWindow
{
ControlSend, ahk_parent, ^{RIGHT}  ; > next
return
}
}

if Key=;
{
IfWinExist, ahk_class iTunes
{
ControlSend, ahk_parent, ^{UP}  ; vol up
ControlSend, ahk_parent, ^{UP}  ; vol up
ControlSend, ahk_parent, ^{UP}  ; vol up
return
}

IfWinExist, ahk_class SpotifyMainWindow
{
ControlSend, ahk_parent, ^{UP}  ; vol up
ControlSend, ahk_parent, ^{UP}  ; vol up
ControlSend, ahk_parent, ^{UP}  ; vol up
return
}
}

if Key='
{
IfWinExist, ahk_class iTunes
{
ControlSend, ahk_parent, ^{DOWN}  ; vol down
ControlSend, ahk_parent, ^{DOWN}  ; vol down
ControlSend, ahk_parent, ^{DOWN}  ; vol down
return
}

IfWinExist, ahk_class SpotifyMainWindow
{
ControlSend, ahk_parent, ^{DOWN}  ; vol down
ControlSend, ahk_parent, ^{DOWN}  ; vol down
ControlSend, ahk_parent, ^{DOWN}  ; vol down
return
}
}


;endofscript
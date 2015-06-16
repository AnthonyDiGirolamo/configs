#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Capslock::Ctrl

AppsKey::RWin

$~*Ctrl::
if !state
	state :=  (GetKeyState("Shift", "P") ||  GetKeyState("Alt", "P") || GetKeyState("LWin", "P") || GetKeyState("RWin", "P"))
return

$~ctrl up::
if instr(A_PriorKey, "control") && !state
	send {esc}
state := 0
return

space::
Send {space}
return

space & h:: Send {Left}
space & n:: Send {Down}
space & e:: Send {Up}
space & l:: Send {Right}
return

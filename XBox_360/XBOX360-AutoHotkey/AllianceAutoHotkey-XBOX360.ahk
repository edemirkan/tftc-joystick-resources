#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Persistent
SetTimer, WatchPOV, 5
SetTimer, WatchFire ;allows for sustained fire when holding the fire button
return

;A Fire / (LB) Confirm order
Joy1::
if GetKeyState("Joy5")
SendInput {Space}
return
WatchFire:
if GetKeyState("Joy1")
if !GetKeyState("Joy5")
SendInput <!2
return

;B Target target in sight / (LB) Target next enemy starfighter
Joy2::
if !GetKeyState("Joy5")
SendInput <!1
else
SendInput r
return

;X Next target / (LB) Previous target
Joy3::
if !GetKeyState("Joy5")
SendInput t
else
SendInput z
return

;Y Switch turret firing mode / (LB) Control turret
Joy4::
if !GetKeyState("Joy5")
SendInput f
else
SendInput g
return

;RB Target next attacking enemy / (LB) Target next incoming warhead
Joy6::
if !GetKeyState("Joy5")
SendInput e
else
SendInput i
return

;BACK Target next nav bouy / (LB) Drop target
Joy7::
if !GetKeyState("Joy5")
SendInput n
else
SendInput +r
return

;START Target next mission objective / (LB) Cycle components of target
Joy8::
if !GetKeyState("Joy5")
SendInput o
else
SendInput, ,
return

;LeftSTICK Adapt to target's speed / (LB) Dock to target
Joy9::
if !GetKeyState("Joy5")
SendInput {Enter}
else
SendInput +d
return

;RightSTICK Cycle weapons / (LB) Pick up target
Joy10::
if !GetKeyState("Joy5")
SendInput w
else
SendInput +p
return

WatchPOV:
state := GetKeyState("JoyPOV")
if (state > 25000)                       ;LEFT Cycle shields / (LB) Switch firing mode
	if !GetKeyState("Joy5")
	SendInput s
	else
	SendInput x
else if (state > 16000)                  ;DOWN Shield recharge setting / (LB) Energy to shields
	if !GetKeyState("Joy5")
	SendInput {F10}
	else
	SendInput +{F10}
else if (state > 7000)                   ;RIGHT Countermeasures
	SendInput c
else if (state > -1)                     ;UP Laser recharge setting / (LB) Energy to lasers
	if !GetKeyState("Joy5")
	SendInput {F9}
	else
	SendInput +{F9}
Sleep, 150
return

Numpad0::0
return
Numpad1::1
return
Numpad2::2
return
Numpad3::3
return
Numpad4::4
return
Numpad5::5
return
Numpad6::6
return
Numpad7::7
return
Numpad8::8
return
Numpad9::9
return
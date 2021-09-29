; New World No AFK
; To start download autohotkey
; Click run script
; Ensure that you are in world and have the game in view 
; Press the F9 key to start the no AFK
; Press the F9 key again to stop the no AFK
; This currently does not work with the game running in the background

#SingleInstance, Force          ; Forces a single instance of the script. Useful if you edit and re-open your script many times.
#NoEnv                          ;
SendMode Input                  ; 
SetWorkingDir, %A_ScriptDir%    ; Starting Dir


WinGet, newWorldId, ID, New World


#MaxThreadsPerHotkey 3
F9::  ; F9 hotkey (change this hotkey to suit your preferences).
#MaxThreadsPerHotkey 1
if KeepF9Running  ; This means an underlying thread is already running the loop below.
{
    KeepF9Running := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepF9Running := true
Loop
{
    moveAround()
    if not KeepF9Running  ; The user signaled the loop to stop by pressing Win-Z again.
        break  ; Break out of this loop.
}
KeepF9Running := false  ; Reset in preparation for the next press of this hotkey.
return

;Function moveAround
;Enabled sending move in X and then randomize a wait time afterwards.
moveAround() 
{   
        Send, {w down}
        Sleep, 1000
        Send, {w up}

        Sleep 2500

        Send, {a down}
        Sleep, 1000
        Send, {a up}

        Sleep 2500

        Send, {d down}
        Sleep, 1000
        Send, {d up}

        Sleep 2500

        Send, {s down}
        Sleep, 1000
        Send, {s up}

        Sleep 2500

        Random, r, 5000, 15000
        Sleep r
    }
    return
}

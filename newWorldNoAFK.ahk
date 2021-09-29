#SingleInstance, Force          ; Forces a single instance of the script. Useful if you edit and re-open your script many times.
#NoEnv                          ;
SendMode Input                  ; 
SetWorkingDir, %A_ScriptDir%    ; Starting Dir


WinGet, newWorldId, ID, New World


; $+^+F9::
; scriptTrue := !scriptTrue
; return


#MaxThreadsPerHotkey 3
F9::  ; Win+Z hotkey (change this hotkey to suit your preferences).
#MaxThreadsPerHotkey 1
if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepWinZRunning := true
Loop
{
    ; The next four lines are the action you want to repeat (update them to suit your preferences):
    moveAround()
    ; But leave the rest below unchanged.
    if not KeepWinZRunning  ; The user signaled the loop to stop by pressing Win-Z again.
        break  ; Break out of this loop.
}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return

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
    }
    return
}

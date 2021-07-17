#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force ; Forces only one instance of script.

; This script will disable the popup when hovering over the Weather on the taskbar. I much like the little thing. But I do not like the popup.
; Unfortunately, the News and Interests application is the same application as the search function. "SearchApp.exe". This script will allow you to use the Search function, while temporarily renabling the News and Interests hover-over popup.

; If you use the Left Windows key to search, this will work.
; If you use the Right Windows key to saerch, this SHOULD work. I don't have one, so it's untested.

; If you click the start button, then type to search, this... kind of works. The Start button is both "Start" and "Search". When SearchApp.exe is killed, it becomes "Start". This means you have to click the Start button again to be able to start typing. Maybe someone with more knowledge can find a better solution.

; Win+S works as well.

; By default, 10 seconds are given to search something before SearchApp.exe is killed again.

; -G

en_search :=0
Loop {
	WinGetTitle, title, A
	WinGetClass, class, A
	if (en_search = 0)
	{
		Process, Close, SearchApp.exe
	}
	else
	{
		sleep 10000 ; This is the amount of time given to search for things. Default is 10000ms.
		en_search :=0
	}
	
	if (title = "Start" & (class = "Shell_TrayWnd")) 
	{	
		en_search :=1
	}
}

~LWin::
en_search :=1
return

~RWin::
en_search :=1
return
#SingleInstance, Force
SetTitleMatchMode, 2		; 2: A window's title can contain WinTitle anywhere inside it to be a match.
SetTitleMatchMode, Fast		;Fast is default
DetectHiddenWindows, off	;Off is default
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CrLf=`r`n
FileName:="WinPos.txt"

WinGetActiveTitle, SavedActiveWindow
  ParmVals:="Title x y height width"
  SectionToFind:= SectionHeader()
  SectionFound:= 0

  Loop, Read, %FileName%
  {
    if !SectionFound
    {
      ;Read through file until correction section found
      If (A_LoopReadLine<>SectionToFind)
	Continue
    }

		;Exit if another section reached
		If ( SectionFound and SubStr(A_LoopReadLine,1,8)="SECTION:")
			Break

                SectionFound:=1
		Win_Title:="", Win_x:=0, Win_y:=0, Win_width:=0, Win_height:=0

		Loop, Parse, A_LoopReadLine, CSV
		{
			EqualPos:=InStr(A_LoopField,"=")
			Var:=SubStr(A_LoopField,1,EqualPos-1)
			Val:=SubStr(A_LoopField,EqualPos+1)
			IfInString, ParmVals, %Var%
			{
				;Remove any surrounding double quotes (")
				If (SubStr(Val,1,1)=Chr(34))
				{
					StringMid, Val, Val, 2, StrLen(Val)-2
				}
				Win_%Var%:=Val
			}
		}

		If ( (StrLen(Win_Title) > 0) and WinExist(Win_Title) )
		{
			WinRestore
			WinActivate
			WinMove, A,,%Win_x%,%Win_y%,%Win_width%,%Win_height%
		}

  }

  if !SectionFound
  {
    msgbox,,Dock Windows, Section does not exist in %FileName% `nLooking for: %SectionToFind%`n`nTo save a new section, use Win-Shift-0 (zero key above letter P on keyboard)
  }

  ;Restore window that was active at beginning of script
  WinActivate, %SavedActiveWindow%
RETURN

;Create standardized section header for later retrieval
SectionHeader()
{
	SysGet, MonitorCount, MonitorCount
	SysGet, MonitorPrimary, MonitorPrimary
	line=SECTION: Monitors=%MonitorCount%,MonitorPrimary=%MonitorPrimary%

        WinGetPos, x, y, Width, Height, Program Manager
	line:= line . "; Desktop size:" . x . "," . y . "," . width . "," . height

	Return %line%
}


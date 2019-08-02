Menu, Tray, NoIcon

#Include outlook.ahk
#Include cusHotKey.ahk
; #Include Hotkey Help.ahk
; #Include autoComp.ahk
; #Include sap.ahk


^+!q:: ; <-- Paste last 2 entries
  send ^+!2
  Sleep 500
  Send {Tab}^+!2
  Sleep 500
  Return

^+!h:: ; <-- Toggle Tray Icon
If (A_IconHidden = 1){
  Menu, Tray, Icon
}
else {
  Menu, Tray, NoIcon
}
Return

^+!r:: ; <-- R3 login
  InputBox, Vsystem, System, System?
  if ErrorLevel
    Return
  StringSplit, w_array, Vsystem, %A_space%, .
  if (w_array3 = ""){
    w_array3 := "E"
  }
  run, sapshcut.exe -system=%w_array1% -client=%w_array2% -language=%w_array3%
  Return

^+!k:: ; <-- Keepass R3 Login
  SetKeyDelay, 50
  InputBox, Vsystem, System, System?
  if ErrorLevel
    Return
  send ^+!f
  sleep 500
  send ^e
  send %Vsystem%
  send {Enter}
  sleep 200
  send ^u
  send ^!f
  sleep 200
  send {Esc}
  Return

^+!d:: ; <-- Delete line
  SetKeyDelay, 50
  send {home}
  send +{end}
  sleep 100
  send {BS}
  Return

^+!\:: ; <-- Delete Rev-trac
  SetKeyDelay, 200
  InputBox, Vno, No, No?
  if ErrorLevel
    Return
  loop %Vno%{
  send !{r}
  send {d}
  sleep 2000
  send +{Tab}
  send {Enter}
  sleep 1000
  send {Enter}
  sleep 3000
  send {down}
  }
  Return

^+!v:: ; <-- Patse Text
SendInput, %Clipboard%
Return

#t::WinSet, AlwaysOnTop,toggle,A ; <-- Toggle on top

:*:@pl:: ; <-- LT3 login
SetKeyDelay, 50
Vpassword := "Portal99!"
InputBox, Vusers, User, User?
If ErrorLevel
return
EOM := SubStr(Vusers, 1, 1)
Vinfo := SubStr(Vusers, 2)
if (EOM = "e")
{
  Veom := "ess"
}
else if (EOM = "m")
{
  Veom := "mss"
}
Else
{
  Vuser := Vusers
  SendInput, %Vuser%{tab}{raw}%Vpassword%
  Return
}
if (Vinfo = "dm")
{
  Vuser := "demomanager"
}
else if (Vinfo = "ee")
{
  Vuser := "demoemployee"
}
Else
{
Vuser := "test" . Veom . "_" . Vinfo
}
SendInput, %Vuser%{tab}{raw}%Vpassword%
Return

:*:$rq:: ; <-- Rev-trac in Q
InputBox, Vreq, Requestor, Requestor?
If ErrorLevel
Return
StringUpper, Vreq, Vreq, T
sendinput Hi, %Vreq%,{Enter}Rev-trac %clipboard% moved to Q.{Enter}Please check and move it to P.{Enter}Thank you{!}
Return

:*:$rd:: ; <-- Change in D
InputBox, Vreq, Requestor, Requestor?
If ErrorLevel
Return
StringUpper, Vreq, Vreq, T
sendinput Hi, %Vreq%,{Enter}Fix in D.{Enter}Please check.{Enter}Thank you{!}
Return

:*:$rp:: ; <-- Change in P
InputBox, Vreq, Requestor, Requestor?
If ErrorLevel
Return
StringUpper, Vreq, Vreq, T
sendinput Hi, %Vreq%,{Enter}Fix in P.{Enter}Please check.{Enter}Thank you{!}
Return

:*:$hci:: ; <-- Help to check issue
InputBox, Vown, Developer, Developer?
If ErrorLevel
Return
StringUpper, Vown, Vown, T
sendinput Hi, %Vown%,{Enter}Can you help to check this?{Enter}Thank you{!}
Return

:*:$edm:: ; <-- Frontend Deployment Mail
InputBox, Vcrm, CRM, CRM?
If ErrorLevel
Return
sendinput VIITServiceCenter@adp.com;GVIITServicesLeads@adp.com;GV.ITIO.Team.26@ADP.com{tab}{tab}{tab}Emergency Deployment of Frontend [Hotfix]{tab}Hi, Team,{Enter}Thanks to deploy the frontend components to Production.{Enter}CRM %Vcrm%{Enter}%clipboard%{Enter}Thank you!
Return

:*:$acrm:: ; <-- Ask for CRM ticket
InputBox, Vreq, Requestor, Requestor?
If ErrorLevel
Return
StringUpper, Vreq, Vreq, T
sendinput Hi, %Vreq%,{Enter}Can you create a CRM ticket? We will check and get back to you.{Enter}Thank you{!}
Return

:*:$ifix:: ; <-- Inform fixed in TD3
InputBox, Vreq, Requestor, Requestor?
If ErrorLevel
Return
StringSplit, w_array, Vreq, %A_Space%,
StringUpper, w_array1, w_array1, T
sendinput Hi, %w_array1%,{Enter}I have fixed the issue in TD3 and tested ok. It will be moved with feature pack FP%w_array2%.{Enter}Let me know if you need emergency deployment if it impacts payroll or go-live.{Enter}{Enter}Thank you{!}
Return

:*:$aru:: ; <-- Ask for R3 user
InputBox, Vreq, Requestor, Requestor?
If ErrorLevel
Return
StringUpper, Vreq, Vreq, T
sendinput Hi, %Vreq%,{Enter}Can you share your R3 user so that I can check?{Enter}Thank you{!}
Return

:*:$aed:: ; <-- CRM Frontend Deployment
sendinput Hi,{Enter}Can you help to move the below component to LPx? I approve this as scrum master of XSS APAC.{Enter}%clipboard%{Enter}Thank you{!}
Return

:*:$ousc:: ; <-- OPS US created
InputBox, Vown, Developer, Developer?
If ErrorLevel
Return
StringUpper, Vown, Vown, T
sendinput Hi, %Vown%,{Enter}OPS user story %clipboard% created and assigned to you.{Enter}Please update the estimation and to-do hours in the user story.{Enter}Thank you{!}
Return

:*:$dusc:: ; <-- DEV US created
InputBox, Vown, Developer, Developer?
If ErrorLevel
Return
StringUpper, Vown, Vown, T
sendinput Hi, %Vown%,{Enter}DEV user story %clipboard% created and assigned to you.{Enter}Please work on it with priority.{Enter}Thank you{!}
Return

:*:$aav:: ; <-- Ask for availability
InputBox, Vdate, Date, Date?
If ErrorLevel
Return
StringSplit, w_array, Vdate, |
; w_array := StrSplit(Vdate, "|")
SendInput, xss apac{Tab}{Tab}Availability for next 2 sprints{Tab}Hi, guys,{Enter}May I know your availability for the next 2 sprints from %w_array1% to %w_array2%?{Enter}Thank you{!}
Return

:*:$dusm:: ; <-- Dev US created mail
InputBox, Vown, Developer, Developer?
If ErrorLevel
Return
StringUpper, Vown, Vown, T
sendinput %Vown%{Tab}{Tab}Dev User Story Created{Tab}Hi, %Vown%,{Enter}DEV user story %clipboard% created and assigned to you.{Enter}Please work on it with priority.{Enter}Thank you{!}
Return

:*:$ca:: ; <-- Check Attachment
InputBox, Vreq, Requestor, Requestor?
If ErrorLevel
Return
SendInput,Hi, %Vreq%,{Enter}Please refer to the attached analysis.docx and check.{Enter}{Enter}Thank you{!}
Return



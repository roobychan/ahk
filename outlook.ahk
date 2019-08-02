
Members = Biqiang.Xiao|Edmond.Guan|Kadari.Praneeth|Nolan.Zhang|Richard.Sefton|Rooby.Chen|Raghupathi.Jella|Sandy.Hu|Wenqian.Chen
Adp = @adp.com
Options = Estimation|Update US|Update CRM

^+!e:: ; <-- Send Email
#SingleInstance, force
Gui, Add, Text,, Email
Gui, Add, ComboBox, vOption, %Options%
Gui, Add, ComboBox, vReciever, %Members%
Gui, Add, Edit, r9 vCRMList w135
Gui, Add, Button, Default w80, OK
Gui, Show
Return

GuiEscape:
GuiClose:
Gui, Destroy
Return

ButtonOK:
Gui, Submit
name := ""
RegExMatch(Reciever, "^(.*)(?=\.)" , name )
body =
(Join
	<p>Hi, %name%,<br>
	)
subj = ""
if (Option = "Estimation") {
	subj := "Ticket Estimation"
	body =
	(Join
		%body%
		Please let me know the estimation of below tickets and update Rally:<br>
		)
}
else if (Option = "Update US") {
	subj := "Update User Story"
	body =
	(Join
		%body%
		Could you please update the below User Stories:<br>
		)
}
else if (Option = "Update CRM") {
	subj := "Update Ticket"
	body =
	(Join
		%body%
		Could you please let me know the status of below tickets:<br>
		)
}

tcts := StrSplit(CRMlist, "`n")
Loop % tcts.MaxIndex(){
	tmp := tcts[A_Index]
	body =
	(Join
		%body%
		<li>%tmp%</li>
		)
}
body =
(Join
	%body%</p>
	<p>Thank you!<br>
	Rooby Chen</p>
	)
cc := ""
SendMail(Reciever . Adp, cc, subj, body )
Gui, Destroy
Return


^+!l:: ; <-- Create Leave Appointment
#SingleInstance, force
Gui, Add, Text,, Leave
Gui, Add, ComboBox, vUser, %Members%
Gui, Add, ComboBox, VDOpt, Full|AM|PM
Gui, Add, DateTime, vFDate, yyyy-MM-dd
Gui, Add, DateTime, vTDate, yyyy-MM-dd
Gui, Add, Button, Default w80, Create
Gui, Show
Return

ButtonCreate:
Gui, Submit
name := ""
RegExMatch(User, "^(.*)(?=\.)" , name )
FormatTime, ffdate,%FDate%, ddd dd-MM
FormatTime, ftdate,%TDate%, ddd dd-MM
sub := name . " on leave"
If (DOpt = "Full"){
	If (TDate = FDate){
		sub := sub . " on " . ffdate
	}
	else {
		sub := sub . " from " . ffdate . " to " ftdate
	}
}
else if (DOpt = "AM"){
	sub := sub . " on " . ffdate . " morning"
}
else if (DOpt = "PM"){
	sub := sub . " on " . ffdate . " afternoon"
}
SendLeave(sub, FDate, TDate, DOpt)
Gui, Destroy
Return



SendMail(rec, cc, subj, body){
	ComObjError(false)   ;disable COM error messages for some non available properties
	m := ComObjCreate("Outlook.Application").CreateItem(0)
	m.Subject := subj
	m.To := rec
	m.HTMLBody := body
	m.Display
	; m.Send
}

SendLeave(subj, fdate, tdate, opt){
	FormatTime, fdate, %fdate%, ShortDate
	FormatTime, tdate, %fdate%, ShortDate
	ComObjError(false)   ;disable COM error messages for some non available properties
	m := ComObjCreate("Outlook.Application").CreateItem(1)
	m.MeetingStatus := 1
	m.Subject := subj
	m.Recipients.Add("XSS APAC Group")
	m.ReminderSet := False
	m.BusyStatus := 0
	m.ResponseRequested := False
	If (opt = "Full"){
		m.Start := fdate . " 00:00:00"
		m.AllDayEvent := True
	}
	else if (opt = "AM"){
		m.Start := fdate . " 09:00:00"
		m.End := fdate . " 13:00:00"
	}
	else if (opt = "PM"){
		m.Start := fdate . " 13:00:00"
		m.End := fdate . " 18:00:00"
	}
	m.Display
	; m.Send
}

GetName(rec, name){
	RegExMatch(rec, "^(.*)(?=\.)" , name )
}

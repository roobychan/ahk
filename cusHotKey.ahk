lcTrl & LWin::return
LCtrl & RWin::return
LCtrl & Alt::return
LCtrl & Ctrl::return
LCtrl & Shift::return
LCtrl & a::Send ^+!{a}
LCtrl & b::Send ^+!{b}
LCtrl & c::Send ^+!{c}
LCtrl & d::Send ^+!{d}
LCtrl & e::Send ^+!{e}
LCtrl & f::Send ^+!{f}
LCtrl & g::Send ^+!{g}
LCtrl & h::Send ^+!{h}
LCtrl & i::Send ^+!{i}
LCtrl & j::Send ^+!{j}
LCtrl & k::Send ^+!{k}
LCtrl & l::Send ^+!{l}
LCtrl & m::Send ^+!{m}
LCtrl & n::Send ^+!{n}
LCtrl & o::Send ^+!{o}
LCtrl & p::Send ^+!{p}
LCtrl & q::Send ^+!{q}
LCtrl & r::Send ^+!{r}
LCtrl & s::Send ^+!{s}
LCtrl & t::Send ^+!{t}
LCtrl & u::Send ^+!{u}
LCtrl & v::Send ^+!{v}
LCtrl & w::Send ^+!{w}
LCtrl & x::Send ^+!{x}
; LCtrl & x::CtrlAltShift{x}
LCtrl & y::Send ^+!{y}
LCtrl & z::Send ^+!{z}
LCtrl & 1::Send ^+!{1}
LCtrl & 2::Send ^+!{2}
LCtrl & 3::Send ^+!{3}
LCtrl & 4::Send ^+!{4}
LCtrl & 5::Send ^+!{5}
LCtrl & 6::Send ^+!{6}
LCtrl & 7::Send ^+!{7}
LCtrl & 8::Send ^+!{8}
LCtrl & 9::Send ^+!{9}
LCtrl & 0::Send ^+!{0}
LCtrl & F1::Send ^+!{F1}
LCtrl & F2::Send ^+!{F2}
LCtrl & F3::Send ^+!{F3}
LCtrl & F4::Send ^+!{F4}
LCtrl & F5::Send ^+!{F5}
LCtrl & F6::Send ^+!{F6}
LCtrl & F7::Send ^+!{F7}
LCtrl & F8::Send ^+!{F8}
LCtrl & F9::Send ^+!{F9}
LCtrl & F10::Send ^+!{F10}
LCtrl & F11::Send ^+!{F11}
LCtrl & F12::Send ^+!{F12}
LCtrl & ,::
CoordMode, Mouse, Screen
MouseMove, 961, 586
KeyWait, Control
MouseClick, left
Return
LCtrl & .::
CoordMode, Mouse, Screen
MouseMove, 2881, 586
KeyWait, Control
MouseClick, left
Return
LCtrl & /::Send ^+!{/}
LCtrl & '::Send ^+!{'}
LCtrl & [::Send ^+!{[}
LCtrl & ]::Send ^+!{]}
LCtrl & \::Send ^+!{\}
LCtrl & -::Send ^+!{-}
LCtrl & =::Send ^+!{=}
; LCtrl & `;::Send ^+!{`;}
LCtrl & `::Return
LCtrl & Enter::Send ^+!{Enter}
LCtrl & Backspace::Send ^+!{Backspace}
LCtrl & Delete::Send ^+!{Delete}
LCtrl & Insert::Send ^+!{Insert}
LCtrl & Home::
WinGetActiveStats, Title, Width, Height, X, Y
If (X <= 1920){
	X = 0
}
Else
{
	X = 1921
}
Y = 0
Width = 400
Height = 585
WinMove, %Title%, , X, Y, Width, Height
Return
LCtrl & End::
WinGetActiveStats, Title, Width, Height, X, Y
If (X <= 1920){
	X = 401
}
Else
{
	X = 2381
}
Y = 0
Width = 1520
Height = 1170
WinMove, %Title%, , X, Y, Width, Height
Return
LCtrl & PgUp::
WinGetActiveStats, Title, Width, Height, X, Y
If (X <= 1920){
	X = 0
}
Else
{
	X = 1921
}
Y = 586
Width = 400
Height = 585
WinMove, %Title%, , X, Y, Width, Height
Return
LCtrl & PgDn::
If (X <= 1920){
	X = 0
}
Else
{
	X = 1921
}
Y = 0
Width = 400
Height = 1170
WinMove, %Title%, , X, Y, Width, Height
Return
LCtrl & Up::Send ^+!{Up}
LCtrl & Down::Send ^+!{Down}
LCtrl & Left::Send #+{Left}
LCtrl & Right::Send #+{Right}
LCtrl::return
; LAlt & 1::Send !{F1}
; LAlt & 2::Send !{F2}
; LAlt & 3::Send !{F3}
; LAlt & 4::Send !{F4}
; LAlt & 5::Send !{F5}
; LAlt & 6::Send !{F6}
; LAlt & 7::Send !{F7}
; LAlt & 8::Send !{F8}
; LAlt & 9::Send !{F9}
; LAlt & 0::Send !{F10}
; LAlt & -::Send !{F11}
; LAlt & =::Send !{F12}
; `::Send {``}
; ^`::Send ^{``}
; +`::Send +{``}
; !`::Send !{``}
; ^+`::Send ^+{``}
; ^!`::Send ^!{``}
; !+`::Send !+{``}
; ^!+`::Send ^!+{``}
; #`::Send #{``}
; ^#`::Send ^#{``}
; +#`::Send +#{``}
; !#`::Send !#{``}
; ^!#`::Send ^!#{``}
; ^+#`::Send ^+#{``}
; +!#`::Send +!#{``}
; ^+!#`::Send ^+!#{``}
; ` & Shift::`
LCtrl & Esc::Send {Esc}
; ` & Esc::Send {Esc}
; ` & a::Send +!{a}
; ` & b::Send +!{b}
; ` & c::Send +!{c}
; ` & d::Send +!{d}
; ` & e::Send +!{e}
; ` & f::Send +!{f}
; ` & g::Send +!{g}
; ` & h::Send +!{h}
; ` & i::Send +!{i}
; ` & j::Send +!{j}
; ` & k::Send +!{k}
; ` & l::Send +!{l}
; ` & m::Send +!{m}
; ` & n::Send +!{n}
; ` & o::Send +!{o}
; ` & p::Send +!{p}
; ` & q::Send +!{q}
; ` & r::Send +!{r}
; ` & s::Send +!{s}
; ` & t::Send +!{t}
; ` & u::Send +!{u}
; ` & v::Send +!{v}
; ` & w::Send +!{w}
; ` & x::Send +!{x}
; ` & y::Send +!{y}
; ` & z::Send +!{z}
; ` & 1::Send +!{1}
; ` & 2::Send +!{2}
; ` & 3::Send +!{3}
; ` & 4::Send +!{4}
; ` & 5::Send +!{5}
; ` & 6::Send +!{6}
; ` & 7::Send +!{7}
; ` & 8::Send +!{8}
; ` & 9::Send +!{9}
; ` & 0::Send +!{0}
; ` & F1::Send +!{F1}
; ` & F2::Send +!{F2}
; ` & F3::Send +!{F3}
; ` & F4::Send +!{F4}
; ` & F5::Send +!{F5}
; ` & F6::Send +!{F6}
; ` & F7::Send +!{F7}
; ` & F8::Send +!{F8}
; ` & F9::Send +!{F9}
; ` & F10::Send +!{F10}
; ` & F11::Send +!{F11}
; ` & F12::Send +!{F12}
; ` & ,::Send +!{,}
; ` & .::Send +!{.}
; ` & /::Send +!{/}
; ` & '::Send +!{'}
; ` & [::Send +!{[}
; ` & ]::Send +!{]}
; ` & \::Send +!{\}
; ` & -::Send +!{-}
; ` & =::Send +!{=}
; ` & `;::Send +!{`;}
; ` & Space::Send +!{Space}
; ` & Enter::Send +!{Enter}
; ` & Backspace::Send +!{Backspace}
; ` & Delete::Send +!{Delete}
; ` & Insert::Send +!{Insert}
; ` & Home::Send +!{Home}
; ` & End::Send +!{End}
; ` & PgUp::Send +!{PgUp}
; ` & PgDn::Send +!{PgDn}
; ` & Up::Send +!{Up}
; ` & Down::Send +!{Down}
; ` & Left::Send +!{Left}
; ` & Right::Send +!{Right}
; ` & PrintScreen::Send +!{PrintScreen}
; ` & Tab::ShiftAltTab
; ` & Ctrl::return
; ` & Alt::return
; ` & LWin::return
; ` & RWin::return
; Esc & 1::Send {F1}
; Esc & 2::Send {F2}
; Esc & 3::Send {F3}
; Esc & 4::Send {F4}
; Esc & 5::Send {F5}
; Esc & 6::Send {F6}
; Esc & 7::Send {F7}
; Esc & 8::Send {F8}
; Esc & 9::Send {F9}
; Esc & 0::Send {F10}
; Esc & -::Send {F11}
; Esc & =::Send {F12}
; Esc::Return

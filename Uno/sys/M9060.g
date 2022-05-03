;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Define Global Variables ===============================================================
if !{ exists(global.filamentTemp) }
	global filamentTemp=0
else
	set global.filamentTemp=0
if !{ exists(global.chamberTemp) }
	global chamberTemp=0
else
	set global.chamberTemp=0
if !{ exists(global.bedTemp) }
	global bedTemp=0
else
	set global.bedTemp=0
if !{ exists(global.cooldown) }
	global cooldown=true
else
	set global.cooldown=true
if !{ exists(global.m291Response) }
	global m291Response=false
else
	set global.m291Response=false
;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Sets Global Variables =================================================================
if {param.N} == "bedTemp"
	set global.bedTemp = {param.V}
elif {param.N} == "filamentTemp"
	set global.filamentTemp = {param.V}
elif {param.N} == "chamberTemp"
	set global.chamberTemp = {param.V}
elif {param.N} == "cooldown"
	set global.cooldown = {param.V}
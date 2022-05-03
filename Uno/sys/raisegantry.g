;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Raise Gantry ==========================================================================
if move.axes[2].machinePosition < 5
	if move.axes[2].homed == false
		G92 Z0  ; Set Z=0
	G1 Z5 F3000 ; Raise gantry
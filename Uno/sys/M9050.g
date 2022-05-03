;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Power Toggle ==========================================================================
M400               ; Wait until idle
if boards[0].vIn.current > 23
	M291 S3 R"Turn off power?" P"Are you sure you want to turn off power?"
	M0             ; Unconditional stop
	M118 P0 S"Entering low power mode (after cooling down)" L2
	M950 H1 C"nil" ; Unassign Toolboard heater
	M81 S1         ; Disable 24v power supply
else
	M118 P0 S"Entering full power mode" L2
	M999 A1        ; Soft-reset PanelDue
	M999           ; Soft-reset Mainboard
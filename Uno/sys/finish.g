;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Finish Job ============================================================================
M400                  ; Wait for current moves to finish
M106 P0 S0		      ; Turns off part cooling fan
G91                   ; Set to Relative Positioning
G1 Z10 F6000          ; Lifts gantry
G90                   ; Set to Absolute Positioning
G1 E-10 F1200         ; Retracts filament
G1 X10 Y10 Z310 F6000 ; Move tool head out of the way

if global.cooldown
	M104 S0 ; Turn off extruder heater
	M140 S0 ; Turns off build plate heater
	M141 S0 ; Turns off chamber heater
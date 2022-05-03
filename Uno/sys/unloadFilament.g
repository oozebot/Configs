;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Unload Filament =======================================================================
M9291 P"Do you want to automatically unload filament?" R"Auto unload filament?"
if global.m291Response
	M291 P"Please wait while the nozzle temperature is adjusted" R"Unloading Filament" S0 T600
	M703                             ; Load selected filament settings
	G10 P0 S{global.filamentTemp} R0 ; Set current tool temperature
	M116                             ; Wait for the temperature to be reached
	M292                             ; Hide message
	M291 P"Unloading filament - please wait" R"Unloading Filament" S0 T60
	M83                              ; Extruder to relative mode
	G1 E-10 F300                     ; Retract filament 10mm
	G1 E-120 F600                    ; Retract filament 120mm
	M400                             ; Wait for idle
	M292                             ; Hide message
	M291 P"Disable Hot End Heater?" R"Turn off Heat?" S3
	G10 S0                           ; Turn heater off
	
set global.bedTemp= 0      ; Resets build plate temperature
set global.chamberTemp= 0  ; Resets chamber temperature
set global.filamentTemp= 0 ; Resets extrusion temperature
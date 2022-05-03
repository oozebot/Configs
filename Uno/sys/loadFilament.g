;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Load Filament =========================================================================
M9291 P"Do you want to automatically load filament?" R"Auto load filament?"
if global.m291Response
	M291 P"Please wait while the nozzle temperature is adjusted" R"Loading Filament" S0 T600
	M703                             ; Load selected filament settings
	G4 S1                            ; wait one second
	G10 P0 S{global.filamentTemp} R0 ; Set current tool temperature
	M116                             ; Wait for the temperature to be reached
	M292                             ; Hide message
	M291 P"Loading filament - please wait" R"Loading Filament" S0 T60
	M83                              ; Extruder to relative mode
	G1 E100 F300                     ; Feed filament 100mm
	G1 E10 F150                      ; Feed filament 10mm
	G4 S1                            ; Wait 1s
	G1 E-30 F1200                    ; Retract filament 30mm
	M400                             ; Wait for idle
	M292                             ; Hide message
	M291 P"Disable Hot End Heater?" R"Turn off Heat?" S3
	G10 S0                           ; Turn heater off
else
	M703                             ; Load selected filament settings
;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Home Z-Axis ===========================================================================
M98 P"raiseGantry.g"        ; Raise gantry if needed
M280 P0 S160                ; Reset BLTouch
M17 Z                       ; Enabled z-steppers
G4 S1                       ; Wait a second    
G1 X136 Y136 F24000         ; Move toolhead to center of build plate 
M400                        ; Wait until idle
M561                        ; Clear bed transformations
M558 F1200 A1               ; Configure z-probe
M208 Z-100 S1               ; Allow negative z-axis travel
G92 Z500                    ; Set z-height above actual travel
G30 Z-500                   ; Single probe build plate
M558 F240 A20               ; Configure z-probe
M208 Z0 S1                  ; Disallow negative z-axis travel
M561                        ; Clear bed transformations
G30 Z-500                   ; Probe build plate
G30 P0 X20 Y155 Z-99999     ; Probe left side of build plate
G30 P1 X290 Y155 Z-99999 S2 ; Probe right side of build plate
M400                        ; Wait until idle
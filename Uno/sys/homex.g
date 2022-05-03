;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Home X-Axis ===========================================================================
M98 P"raiseGantry.g" ; Raise gantry if needed
G91                  ; Use relative positioning
M913 X40 Y40         ; Reduce motor currents
M915 P3:5 S4 R0 F0   ; Set stall detection for motors 3 & 5
G4 P250              ; Wait a moment
G1 X-500 F4000 H1    ; Move x-axis left
M400                 ; Wait until idle
G90                  ; Back to absolute positioning
M913 X100 Y100       ; Increase motor currents
G4 P250              ; Wait a moment
G1 X27 F6000         ; Move x-axis to build plate
M400                 ; Wait until idle
G92 X0               ; Set x-axis position = 0
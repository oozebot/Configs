;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Pause Job =============================================================================
M400           ; Wait for idle
G91            ; Set relative positioning
G1 Z200 F6000  ; Raise gantry
G90            ; Set absolute positioning
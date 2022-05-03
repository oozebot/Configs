;==========================================================================================
;== Filament Specific Settings ============================================================
set global.bedTemp= 110      ; Defines build plate temperature
set global.chamberTemp= 65   ; Defines chamber temperature
set global.filamentTemp= 250 ; Defines extrusion temperature
M221 S92.5                   ; Set flow percentage
M220 S100                    ; Set speed factor
M204 P2400 T4800             ; Set print acceleration
M572 D0 S0.038               ; Set pressure advance
M207 S0.66 F4800 T4800 Z0.33 ; Set firmware retraction
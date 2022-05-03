;==========================================================================================
;== Filament Specific Settings ============================================================
set global.bedTemp= 80       ; Defines build plate temperature
set global.chamberTemp= 0    ; Defines chamber temperature
set global.filamentTemp= 220 ; Defines extrusion temperature
M221 S93                     ; Set flow percentage
M220 S82.3333                ; Set speed factor
M204 P2400 T12000            ; Set print acceleration
M572 D0 S0.05                ; Set pressure advance
M207 S1.50 F3600 T3600 Z0.5  ; Set firmware retraction
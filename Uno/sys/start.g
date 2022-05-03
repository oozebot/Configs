;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Start Print Job =======================================================================
T0	       ; Set Tool0 as default
G21	       ; Set units to millimeters
G90	       ; Use absolute coordinates
M83	       ; Use relative distances for extrusion
M141 S0    ; Disables chamber heater
M106 P0 S0 ; Disables part cooling fan

;==========================================================================================
;== User Prompt  ==========================================================================
M9291 R"Cooldown?" P"Proceed to cooldown machine when complete?"
set global.cooldown = global.m291Response

;==========================================================================================
;== Filament Config =======================================================================
M703 ; Load selected filament settings

;==========================================================================================
;== Enables Heat / Stabilizes =============================================================
M140 S{global.bedTemp} R0        ; Enable build plate heater
G10 P0 S{global.filamentTemp} R0 ; Enable hot end heater
M116                             ; Wait for temps to stabilize
M141 S{global.chamberTemp}       ; enable chamber heater

;==========================================================================================
;== Homing / Mesh Leveling ================================================================
G28     ; Home all axes
G29 S1  ; Load height map
M376 H5 ; Set mesh taper

;==========================================================================================
;== Prime extruder ========================================================================
M208 X-25 S1
G1 X-25 Y90 Z5 F9000
G1 Z2 F3000
G1 E60 F600
M106 S256
G4 S1
M106 S0
G10
G1 X-13 F6000
G1 Y160 Z1 F1000
G1 Z5 F6000
M208 X0 S1
;==========================================================================================
;== Custom Settings (unique per printer) ==================================================
M208 X0:310 Y0:310 Z0:310    ; Sets Min/Max Axis travel (310mm x 310mm x 310mm)
;M208 X0:410 Y0:410 Z0:410   ; Sets Min/Max Axis travel (410mm x 410mm x 410mm)
M671 X-95:420 Y0:0 S6        ; Relative belt position
M593 P"ZVDD" F36.1 S0.00     ; Input shaping
M556 S100 X0.00 Y0.00 Z0.00  ; Skew compensation  (X = XY, Y = YZ, Z = XZ)
M579 X1.0000 Y1.0000 Z1.0000 ; Set scale compensation
G31 Z3.00                    ; Trigger Z-height



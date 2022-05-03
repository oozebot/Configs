;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Manually level the build plate ========================================================
M291 S3 P"WARNING! This procedure should only be used for leveling the bed to the gantry. You will need to re-run the auto bed leveling macro to replace the height map after it completes." R"Do you want to proceed?"
if move.axes[0].homed == false
	M98 P"homex.g"        ; Home the X-axis
if move.axes[1].homed == false
	M98 P"homey.g"        ; Home the Y-axis
G1 X136 Y136 F24000       ; Move tool to center of the build plate
M558 F1200 A1             ; Adjust z-probe parameters
G92 Z500                  ; Set z-height above actual travel
G30 Z-500                 ; Single probe build plate
M558 F240 A20             ; Adjust z-probe parameters
M561                      ; Clear bed transformations
G30 Z-500                 ; Probe build plate
M208 X-10 Y-10 S1         ; Allow negative travel for X & Y
M557 X20:290 Y20:290 S135 ; 9-point mesh
M561                      ; Clear bed transformations
G29 S0                    ; Perform mesh probing
M208 X0 Y0 S1             ; Disallow negative travel for X & Y
G1 X136 Y136 Z150 F24000  ; Move tool to center of the build plate
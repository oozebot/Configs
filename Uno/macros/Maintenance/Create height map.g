;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Creates Height Map ====================================================================
M291 S3 P"Running this script will replace the height map. Do you want to proceed?" R"Replace height map?"
if move.axes[0].homed == false
	M98 P"homex.g"           ; Home the X-axis
if move.axes[1].homed == false
	M98 P"homey.g"           ; Home the Y-axis
M98 P"homez.g"               ; Home the Y-axis
M208 X-10 Y-10 S1            ; Allow negative travel for X & Y

M290 R0 S0                   ; cancel baby stepping
G29 S2                       ; cancel mesh bed compensation

;=====================================================================
;== Select only one of the following mesh densities ==================
;M557 X20:290 Y20:290 S135   ; 9-point mesh
;M557 X20:290 Y20:290 S67.5   ; 25-point mesh
M557 X20:290 Y20:290 S33.75 ; 81-point mesh
;M557 X20:290 Y20:290 S18    ; 225-point mesh

M561                         ; Clear bed transformations
G29 S0                       ; Perform mesh probing
M208 X0 Y0 S1                ; Disallow negative travel for X & Y
G1 X136 Y136 Z150 F24000     ; Move tool to center of the build plate
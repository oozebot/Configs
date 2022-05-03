;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Manually level the gantry =============================================================
M291 S3 P"WARNING! Do not proceed unless leveling blocks have been installed. Hold gantry to keep it from lowering too quickly." R"Do you want to proceed?"
M291 S3 P"This procedure rarely needs to be ran. Please verify leveling blocks are in place before clicking OK." R"Are you sure?"
M569.7 P0 C"nil"   ; Clears stepper brake port
M950 P11 C"0.out1" ; Creates output port
M42 P11 S1         ; Enables port, releasing brakes
M18                ; Disable steppers
M291 S2 P"Steppers have been disabled. Click OK once gantry is level to frame"
M999               ; Resets machine
;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Power Settings ========================================================================
M80 C"!pson"      ; Turns on 24v power supply
M950 P0 C"0.out0" ; Creates P0 as GPIO
M42 P0 S1         ; Enables power to Toolboard(s)
G4 S2             ; Wait 1 second before proceeding

;==========================================================================================
;== Printer Kinematics ====================================================================
M669 K1 ; CoreXY mode

;==========================================================================================
;== PanelDue ==============================================================================
M575 P1 B57600 S1 ; Configures PanelDue

;==========================================================================================
;== Stepper Assignments ===================================================================
M569 P0.0 S1  ; Defines stepper motor on port 0.0
M569 P0.2 S0  ; Defines stepper motor on port 0.2
M569 P0.3 S0  ; Defines stepper motor on port 0.3
M569 P0.5 S0  ; Defines stepper motor on port 0.5
M569 P20.0 S1 ; Defines stepper motor on port 20.0

M584 Z0.2:0.0 X0.3 Y0.5 E20.0    ; Maps steppers to Axes
M350 X16 Y16 Z16 E16 I1          ; Configures microstepping
M92 X100.00 Y100.00 Z100.00 E826 ; Steps per mm
M569.7 P0 C"0.out1"              ; Stepper brake port

M566 X1200 Y1200 Z600 E3600 P1   ; Jerk - max instantaneous speed changes (mm/min)
M201 X12000 Y12000 Z1200 E4800   ; Accelerations (mm/s^2)
M203 X24000 Y24000 Z12000 E2400  ; Maximum speeds (mm/min)
M906 X1700 Y1700 Z1700 E1120 I60 ; Motor currents (mA) and idle factor (%)
M84 S60                          ; Idle timeout

;==========================================================================================
;== Endstops ==============================================================================
M574 X1 S3 ; Sensorless endstop for low end on X
M574 Y1 S3 ; Sensorless endstop for low end on Y

;==========================================================================================
;== Fans ==================================================================================
M950 F0 C"20.out1" ; Creates fan 0 on pin out2 (print fan)
M106 P0 S0 H-1     ; Sets fan 0 to manual control

M950 F1 C"20.out2" ; Creates fan 1 on pin out1 (hotend fan)
M106 P1 T60 H1     ; Sets fan 1 to thermostatic control

M950 F11 C"0.out4"  ; Creates fan 0 on pin out2 (control panel fan)
M106 P11 S192 H-1   ; Sets fan 0 to manual control

;==========================================================================================
;== LED Lights ============================================================================
M950 F12 C"0.out7"  ; Creates P3 on pin out7
M106 P12 S128 H-1   ; Enables P3 to 50%

;==========================================================================================
;== Extruder Heater =======================================================================
M308 S1 P"20.temp0" Y"pt1000"                          ; Configures PT1000 for hot end
M950 H1 C"20.out0" T1                                  ; Creates hotend heater on toolboard
M307 H1 R2.702 K0.632:0.000 D5.77 E1.35 S1.00 B0 V24.1 ; Heating process parameters
M143 H1 S500                                           ; Temperature limit for extruder

;==========================================================================================
;== Build Plate Heater ====================================================================
M308 S0 P"0.temp0" Y"thermistor" T100000 B3950 ; Configures thermistor for build plate
M950 H0 C"0.out2" T0                           ; Creates build plate heater output	
M307 H0 B0 R0.208 C991.6 D26.70 S1.00          ; Heating process parameters
M140 H0                                        ; Defines H0 as build plate heater
M143 H0 S125                                   ; Temperature limit for build plate

;==========================================================================================
;== Enclosure Heater ======================================================================
M308 S2 P"20.temp1" Y"thermistor" T100000 B4267 ; Configures thermistor for chamber
M950 H2 C"0.out3" T2                            ; Creates chamber heater output
M307 H2 B1 C7200 D50 R0.01                      ; Heating process parameters
M141 H2                                         ; Defines H2 as chamber heater
M143 H2 S80                                     ; Temperature limit for chamber

;==========================================================================================
;== Tool Definitions ======================================================================
M563 P0 D0 H1 F0 S"Extruder" ; Defines Tool 0
G10 P0 X0 Y0 Z0 R0 S0        ; Sets Tool 0 offsets and active/standby temps to 0c
M591 P1 C"20.io1.in" S1 D0   ; Defines filament sensor for Tool 0

;==========================================================================================
;== BLTouch ===============================================================================
M558 K0 P9 C"20.io0.in" H3.5 F90 T12000 A20 R0.1 S0.01
M950 S0 C"20.io0.out" ; Servo Control Pin for BLtouch
G31 X19 Y19 P25       ; Probe offsets

;==========================================================================================
;== Accelerometer =========================================================================
M955 P20.0 I20 ; Accelerometer

;==========================================================================================
;== Global Variables / Custom Settings ====================================================
M9060 ; Load global variables
M9062 ; Load custom settings

;==========================================================================================
;== Machine Defaults ======================================================================
T0  ; Selects Tool0 as default
G21 ; Set units to millimeters
G90 ; Absolute coordinates
M83 ; Relative extruder moves
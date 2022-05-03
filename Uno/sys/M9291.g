;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== M291 S3 Enhancement ===================================================================
set global.m291Response=false
M291 R{param.R} P{param.P} S3
set global.m291Response=true
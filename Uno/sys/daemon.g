;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;===========================================================================================
;== Adjusts control panel fan based on board temperature ===================================
if boards[0].mcuTemp.current < 40
	M106 P11 S0.50
elif boards[0].mcuTemp.current < 50
	M106 P11 S0.70
elif boards[0].mcuTemp.current < 60
	M106 P11 S0.90
else
	M106 P11 S1.00
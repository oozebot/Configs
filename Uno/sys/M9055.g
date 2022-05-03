;== oozeBot Elevate Uno
;== Version Number: 1.0 - initial release
;== Release Date: 03/14/2022
;== Release Notes: N/A

;==========================================================================================
;== Reports Current IP ====================================================================
if network.interfaces[0].actualIP != null
	M118 P0 S{network.interfaces[0].actualIP} L1
if network.interfaces[1].actualIP != null
	M118 P0 S{network.interfaces[1].actualIP} L1
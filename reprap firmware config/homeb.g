M400                  ; Wait for current moves to finish
M913 X50 B50          ; drop motor current
M569 P1 V1            ; put driver 1 into stealth chop mode
M569 P2 V1            ; put driver 2 into stealth chop mode
M400
G91                   ; relative positioning
; G1 H2 Z10 F12000   ; lift Z relative to current position
G1 H2 X-10 B-10 F1000 ; go back a few mm
G1 H1 B1000 F200000   ; move quickly to X axis endstop and stop there (first pass)
G1 H0 B-90 F12000      ; go back a few mm
G1 H1 B1000 F200000   ; move slowly to X axis endstop once more (second pass)
; G1 H2 Z-10 F6000   ; lower Z again
G90                   ; absolute positioning
M400
M913 X100 B100        ; return current to 100%
M569 P1 V4000         ; put driver 1 into spread cycle mode
M569 P2 V4000         ; put driver 2 into spread cycle mode
M400
G1 B0 F12000
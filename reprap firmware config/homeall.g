; homeall.g
; called to home all axes
;

G91                ; relative positioning
G1 H2 Z10 F12000   ; lift Z relative to current position
G90

if move.kinematics.name == "Polar"
    G91

    ;;;;;;;;;;;;;;;;;;;
    ;;; HOME RADIUS ;;;
    ;;;;;;;;;;;;;;;;;;;
    M400              ; Wait for current moves to finish
    ; M913 X70          ; drop motor current
    M569 P1 V1        ; put driver 1 into stealth chop mode
    M569 P2 V1        ; put driver 2 into stealth chop mode
    M400

    M400
    M84               ; disable motors
    M17               ; enable motors
    M400
    G1 H2 X0.1 F100   ; wake up driver

    ; Home radius
    G1 H2 X-10 F10000  ; go back a few mm
    G1 H1 X300 F5000  ; move quickly to X axis endstop and stop there

    M400
    M84               ; disable motors
    M17               ; enable motors
    M400
    G1 H2 X0.1 F100   ; wake up driver

    ; Home B axis
    G1 H2 X-83 F10000  ; go back a few mm
    M84 V             ; disable v motor
    G1 H2 U370 F20000 ; move u motor until B is homed

    M400
    M84               ; disable motors
    M17               ; enable motors
    M400
    G1 H2 X0.1 F100   ; wake up driver

    ; Home radius
    G1 H2 X-10 F10000  ; go back a few mm
    G1 H1 X300 F5000  ; move quickly to X axis endstop and stop there (first pass)
    G1 H2 X-10 F10000  ; go back a few mm
    G1 H1 X300 F5000  ; move slowly to X axis endstop once more (second pass)

    M400
    M569 P1 V4000     ; put driver 1 into spread cycle mode
    M569 P2 V4000     ; put driver 2 into spread cycle mode
    M400

    ;;;;;;;;;;;;;;;;
    ;;; HOME BED ;;;
    ;;;;;;;;;;;;;;;;
    G90              ; absolute movement
    G1 H2 X0  F10000  ; move to middle
    G92 X0 Y0 U0 V0  ; define current position as X0 Y0
    
    ;;;;;;;;;;;;;;
    ;;; HOME Z ;;;
    ;;;;;;;;;;;;;;
    G90
    G1 X0 Y0          ; move to center of bed
    G30
    G91                ; relative positioning
    G1 H2 Z15 F12000   ; lift Z relative to current position
    G90

    ; Face nozzle down
    G1 H2 U-90 V90 F20000 
    G92 U0 V0
else
    M98 P"homeb.g"
    M98 P"homex.g"
    M98 P"homey.g"
    M98 P"homec.g"
    M98 P"homez.g"


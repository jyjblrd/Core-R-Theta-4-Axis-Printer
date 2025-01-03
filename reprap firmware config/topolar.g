; Home axies
; M98 P"homeall.g"

; Drives
M569 P0 S0                                                ; physical drive 0 goes forwards using TMC2209 driver timings
M569 P1 S0 D3 V4000                                       ; physical drive 1 goes forwards using TMC2209 driver timings
M569 P2 S1 D3 V4000                                       ; physical drive 2 goes forwards using TMC2209 driver timings
M569 P3 S1                                                ; physical drive 3 goes forwards using TMC2209 driver timings
M569 P4 S0                                                ; physical drive 4 goes forwards using TMC2209 driver timings
M584 Y0 Z4 X1:2 U1 V2 E3                                  ; set drive mapping polar
M350 Y16 X16 Z16 E16 I1                                   ; configure microstepping with interpolation
M92 Y88.8888 X100.00 Z400.00 U22.2222 V22.222 E932.00     ; set steps per mm
M566 Y600.00 X600.00 Z600.00 U600 V600 E300.00            ; set maximum instantaneous speed changes (mm/min)
M203 Y20000.00 X20000.00 U30000 V30000 Z8000.00 E3600.00 ; set maximum speeds (mm/min)
M201 Y2000.00 X2000.00 Z1500.00 U2000 V2000 E5000.00      ; set accelerations (mm/s^2)
M906 Y1300 U1300 V1300 Z800 E800 I30                       ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                                   ; Set idle timeout

; Axis Limits
M208 X-111.5 Y-111.5 Z0 S1                                ; set axis minima. Some compensation for b axis sensorless homing
M208 X111.5 Y111.5 Z200 S0                                ; set axis maxima

; define mesh grid
M557 R110 S50                                                  

; Endstops
M574 X2 S3                                                ; configure sensorless endstop for high end on X
M574 Z1 S2                                                ; configure Z-probe endstop for low end on Z
M915 X B R0 F0 S-10                                       ; sensorless endstop configuration

; Define Kinematics
M669 K7 R111.5 H114 F200.00 A5000.00 S4000 T0.1    ; polar printer

; Say where we are
; G92 X0 Y0 Z5 B0 C0 U0 V0

; Run mesh bed leveling
; G29 S0
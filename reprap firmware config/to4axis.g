; Drives
M569 P0 S1                                                              ; physical drive 0 goes forwards using TMC2209 driver timings
M569 P1 S1  D3 V40                                                      ; physical drive 1 goes forwards using TMC2209 driver timings
M569 P2 S1  D3 V40                                                      ; physical drive 2 goes forwards using TMC2209 driver timings
M569 P3 S1                                                              ; physical drive 3 goes forwards using TMC2209 driver timings
M569 P4 S0                                                              ; physical drive 4 goes forwards using TMC2209 driver timings
M584 C0 Z4 X1 B2 E3 S0                                                  ; set drive mapping 4 axis. treat all as linear axes in feedrate calculations (jhave to use inverse time feed rate in gcode)
M350 C16 X16 Z16 B16 E16 I1                                             ; configure microstepping with interpolation
M92 C88.8888 X100.00 Z400.00 B100.00 E932.00                            ; set steps per mm
M566 C600.00 X600.00 Z600.00 B600.00 E300.00                            ; set maximum instantaneous speed changes (mm/min)
M203 C21600.00 X20000.00 Z8000.00 B21600.00 E3600.00                    ; set maximum speeds (mm/min)
M201 C2000.00 X5000.00 Z1500.00 B2000.00 E2000.00                       ; set accelerations (mm/s^2)
M906 C1300 X1300 Z800 B1300 E800 I30                                     ; set motor currents (mA) and motor idle factor in per cent

; Axis Limits
M208 C-20000000 X-37.5 Z-20 B-94.5 S1                                     ; set axis minima. Some compensation for b axis sensorless homing
M208 C20000000 X114 Z200 B90 S0                                         ; set axis maxima

; Endstops
M574 X2 S3                                                              ; configure sensorless endstop for high end on X
M574 B1 S3                                                              ; configure sensorless endstop for low end on B
M574 Z1 S2                                                              ; configure Z-probe endstop for low end on Z
M915 X B R0 F0 S-10                                                     ; sensorless endstop configuration

; Define Kinematics
M669 K0 C0:0:0:0:1 X-1:0:0:1:0 Z0:0:1:0:0 B0.22222222:0:0:0.222222222:0 ; 4 axis control
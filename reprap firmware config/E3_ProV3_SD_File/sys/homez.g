if move.kinematics.name == "Polar"
                      ; assumes that z probe is correctly rotated to be facing downwards
    G91               
    G1 H2 Z10 F6000   ; lift Z relative to current position
    G90
    G1 X0 Y0          ; move to center of bed
    G30
    G91
    G1 Z5 F6000       ; lift Z relative to current position
    G90
else
    G91               ; relative positioning
    G1 H2 Z10 F6000   ; lift Z relative to current position
    G90
    G1 X0 B-90        ; move to center of bed
    G30
    G91               ; relative positioning
    G1 Z5 F6000       ; lift Z relative to current position
    G90               ; absolute positioning
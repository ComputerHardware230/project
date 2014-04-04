vsim ProjectMid
#the name is the same as your design file
view wave

add wave -hex IR_input
add wave Clock
add wave Reset

add wave RA_output42
add wave RA_output43
add wave RB_output
add wave RM_output
add wave RZ_output
add wave RY_output
add wave ALU_OP
add wave a_inv
add wave b_inv
add wave N_output
add wave ZERO_output
add wave V_output
add wave C_output
add wave IR_output
add wave reg0
add wave reg1
add wave reg2
add wave reg3
add wave reg4

force Clock 0 0, 1 1000 -repeat 2000

#Add instruction
force IR_input 000000001011001000010000 0


#Sub instruction
force IR_input 000000001100001000000001 10000


force Reset 0
run 22000
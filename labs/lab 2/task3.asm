
.data
    prompt:     .asciiz "Enter a number (1 or 2): "
    case1_msg:  .asciiz "Case 1: You selected first option.\n"
    case2_msg:  .asciiz "Case 2: You selected second option.\n"
    def_msg:    .asciiz "Default: Invalid selection.\n"

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 1
    beq $t0, $t1, label_case1

    li $t1, 2
    beq $t0, $t1, label_case2

    j label_default

label_case1:
    li $v0, 4
    la $a0, case1_msg
    syscall
    j end_switch

label_case2:
    li $v0, 4
    la $a0, case2_msg
    syscall
    j end_switch

label_default:
    li $v0, 4
    la $a0, def_msg
    syscall

end_switch:
    li $v0, 10
    syscall
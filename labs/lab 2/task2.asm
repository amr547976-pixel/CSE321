
.data
    msg_n:      .asciiz "Enter count of numbers (N): "
    msg_input:  .asciiz "Enter integer: "
    msg_res:    .asciiz "The Average is: "

.text
.globl main

main:
    li $v0, 4
    la $a0, msg_n
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 0
    li $t2, 0

loop_start:
    beq $t1, $t0, loop_end

    li $v0, 4
    la $a0, msg_input
    syscall

    li $v0, 5
    syscall
    add $t2, $t2, $v0

    addi $t1, $t1, 1
    j loop_start

loop_end:
    div $t2, $t0
    mflo $t3

    li $v0, 4
    la $a0, msg_res
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
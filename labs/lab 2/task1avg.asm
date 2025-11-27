
.data
    prompt:     .asciiz "Enter integer: "
    msg_res:    .asciiz "The average is: "

.text
.globl main

main:
    li $t0, 4
    li $t1, 0

loop:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    
    add $t1, $t1, $v0

    sub $t0, $t0, 1
    bgtz $t0, loop

    li $t2, 4
    div $t1, $t2
    mflo $t3

    li $v0, 4
    la $a0, msg_res
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
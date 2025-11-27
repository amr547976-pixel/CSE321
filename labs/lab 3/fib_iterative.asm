
.data
    msg_input:  .asciiz "Enter a number: "
    msg_result: .asciiz "Fibonacci Value: "

.text
.globl main

main:
    li $v0, 4
    la $a0, msg_input
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    blez $t0, print_zero
    li $t1, 1
    beq $t0, $t1, print_one

    li $t2, 0
    li $t3, 1
    li $t4, 2

loop_start:
    bgt $t4, $t0, loop_end
    add $t5, $t2, $t3
    move $t2, $t3
    move $t3, $t5
    addi $t4, $t4, 1
    j loop_start

loop_end:
    move $a0, $t3
    j print_result

print_zero:
    li $a0, 0
    j print_result

print_one:
    li $a0, 1
    j print_result

print_result:
    move $t6, $a0
    li $v0, 4
    la $a0, msg_result
    syscall

    li $v0, 1
    move $a0, $t6
    syscall

    li $v0, 10
    syscall

.data
    msg_input:  .asciiz "Enter a number: "
    msg_result: .asciiz "Fibonacci Value: "
    newline:    .asciiz "\n"

.text
.globl main

main:
    li $v0, 4
    la $a0, msg_input
    syscall

    li $v0, 5
    syscall
    move $a0, $v0

    jal fibonacci
    move $t0, $v0

    li $v0, 4
    la $a0, msg_result
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall

fibonacci:
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)

    move $s0, $a0

    li $t1, 1
    bgt $s0, $t1, recursive_step
    
    move $v0, $s0
    j end_fib

recursive_step:
    addi $a0, $s0, -1
    jal fibonacci
    move $s1, $v0

    addi $a0, $s0, -2
    jal fibonacci
    
    add $v0, $s1, $v0

end_fib:
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    addi $sp, $sp, 12

    jr $ra
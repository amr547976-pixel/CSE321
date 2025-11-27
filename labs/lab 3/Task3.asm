
.data
A:  .word 4
B:  .word 6

.text
.globl main

compute:
    addi $sp, $sp, -4
    sw   $s0, 0($sp)

    add  $s0, $a0, $a1
    sll  $v0, $s0, 1

    lw   $s0, 0($sp)
    addi $sp, $sp, 4

    jr   $ra

main:
    lw   $t0, A
    lw   $t1, B
    li   $s0, 99

    addi $sp, $sp, -12
    sw   $ra, 0($sp)
    sw   $t0, 4($sp)
    sw   $t1, 8($sp)

    move $a0, $t0
    move $a1, $t1
    jal  compute

    move $t3, $v0
    
    lw   $ra, 0($sp)
    lw   $t0, 4($sp)
    lw   $t1, 8($sp)
    addi $sp, $sp, 12

    jr $ra
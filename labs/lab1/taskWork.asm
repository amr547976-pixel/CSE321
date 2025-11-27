
.data
name_str:   .asciiz "Name:   Amr\n"
id_str:     .asciiz "ID:     20812022100419\n"
course_str: .asciiz "Course: CSE321-Computer-Organization\n"

.text
.globl main

main:
    li $v0, 4
    la $a0, name_str
    syscall

    li $v0, 4
    la $a0, id_str
    syscall

    li $v0, 4
    la $a0, course_str
    syscall

    li $v0, 10
    syscall
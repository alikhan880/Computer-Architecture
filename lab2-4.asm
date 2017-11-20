	.text
	.globl main

main:	
	li $v0, 5
	syscall
	addi $t0, $v0, 0
	
	la $a0, ($t0)
	li $v0, 1
	syscall
	
	la $a0, delim
	li $v0, 4
	syscall
	
	la $a0, ($t0)
	li $v0, 34
	syscall
	
	la $a0, delim
	li $v0, 4
	syscall
	
	la $a0, ($t0)
	li $v0, 35
	syscall
	
	la $a0, delim
	li $v0, 4
	syscall
	
	la $a0, ($t0)
	li $v0, 36
	syscall
	
	
	
	
	.data
	number: .word 0
	delim : .asciiz "\n"
.text
.globl main

main:
	la $a0, str1
	li $v0, 4
	syscall

	li $v0, 8
	la $a0, buffer
	li $a1, 20
	move $t0, $a0
	syscall
	
	la $a0, str2
	li $v0, 4
	syscall
	
	
	li $v0, 5
	syscall
	
	sw $v0, x
	
	la $a0, str3
	li $v0, 4
	syscall
	
	la $a0, buffer
	li $v0, 4
	syscall
	
	
	
	lw $t4, x
	addi $t5, $t4, 4
	
	la $a0, str4
	li $v0, 4
	syscall
	
	addi $a0, $t5, 0
	li $v0, 1
	syscall
	
	la $a0, str5
	li $v0, 4
	syscall
	
	
	
.data
	buffer : .space 30
	x : .word 0
	str1 : .asciiz "What is your name?: "
	str2 : .asciiz "How old are you?"
	str3 : .asciiz "Hello, "  
	str4 : .asciiz "You will be "
	str5: .asciiz " years old in four years"
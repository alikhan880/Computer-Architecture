	.text
	.globl main
	
main:
	li $v0, 4
	la $a0, str1
	syscall
	
	la $a0, newline
	li $v0, 4
	syscall
	
	
	la $s0, str1
	li $t0, ' '
	sb $t0, 17($s0)
	li $v0, 4
	la $a0, str1
	syscall
	
	la $a0, newline
	li $v0, 4
	syscall
	
	la $s0, str1
	li $t0, '\0'
	sb $t0, 7($s0)
	li $t0, 'r'
	sb $t0 3($s0)
	li $t0, '!'
	sb $t0, 6($s0)
	la $a0, str1
	li $v0, 4
	syscall
	
	.data
str1 : .asciiz "Change:inevitable"
str2 : .asciiz "except from vending machines"
newline : .asciiz "\n"

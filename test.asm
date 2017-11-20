	.text
	.globl main
main:
	li $t0, ' '
	la $s0, str1
	sb $t0, 5($s0)
	
	li $t1, 'W'
	li $t2, '!'
	la $s1, str2
	sb $t1, 0($s1)
	sb $t2, 5($s1)
	li $v0, 4
	la $a0, str1
	syscall
	
	
	
	.data
str1 : .asciiz "Hello"
str2 : .asciiz "world"
	
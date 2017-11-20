	.text
	.globl main
main:
	li $v0, 33
	li $a0, 100
	li $a1, 300
	li $a2, 50
	li $a3, 127
	syscall
	
	
	li $v0, 33
	li $a0, 30
	li $a1, 400
	li $a2, 100
	li $a3, 127
	syscall
	
	li $v0, 10
	syscall

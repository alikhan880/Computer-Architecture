	.text
	.globl main
	
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 1
	lb $a0, val
	syscall
	
	addi $t0, $t0, 1
	
	li $v0, 10
	syscall
	
	
	.data
prompt: .asciiz "your code is: "
val: .byte 8
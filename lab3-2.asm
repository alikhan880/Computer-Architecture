	.text
	.globl main

main:
	li $t0, 0
	
loop : 
	li $v0, 4
	la $a0, prompt
	syscall
	li $v0, 5
	syscall
	beqz $v0, loopend
	add $t0, $t0, $v0
	j loop
	
loopend:
	li $v0, 4
	la $a0, prompt_end
	syscall
	move $a0, $t0
	li $v0, 1
	syscall
	
	
	
	.data
prompt : .asciiz "Enter an integer: "
prompt_end : .asciiz "The sum is: "
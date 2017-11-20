	.text
	.globl main
	
main:
	li $t0, 1
	li $t1, 5
	
loop: 
	bgt $t0, $t1, loopend
	li $v0, 1
	move $a0, $t0
	syscall
	addi $t0, $t0, 1
	j loop


loopend:
	li $v0, 10
	syscall
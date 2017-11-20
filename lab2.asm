	.text
	.globl main

main:
	add $t2, $t1, $t0
	li $v0, 10
	syscall
	
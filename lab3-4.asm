	.text
	.globl main


main:
	li $v0, 5
	syscall
	
	move $t0, $v0 # $t0 = n
	jal fib
	la $a0, ($v0)
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
	

ret_zero : 
	li $v0, 0
	jr $ra
	
ret_one : 
	li $v0, 1
	jr $ra
	
	
fib : 
	beqz $t0, ret_zero
	beq $t0, 1, ret_one
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $t0, $t0, -1 # calculate n - 1
	jal fib
	addi $t0, $t0, 1
	lw $ra, 0($sp)
	
	
	sw $v0, 0($sp)
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	addi $t0, $t0, -2 #calculate n - 2
	jal fib
	
	addi $t0, $t0, 2
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	lw $t1, 0($sp)
	add $v0, $v0, $t1 #fib(n - 1) + fib(n - 2)
	
	add $sp, $sp, 4
	jr $ra
	
	
	
	
	
		
	.text
	.globl main


main:
	jal getSum
	
	li $v0, 4
	la $a0, prompt_end
	syscall
	li $v0, 1
	la $a0, ($a1)
	syscall
	li $v0, 10
	syscall




getSum:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	li $v0, 4
	la $a0, prompt
	syscall
	li $v0, 5
	syscall
	move $a1, $v0
	beq $a1, 0, done
	sw $a1, 0($sp)
	jal getSum

done : 
	lw $t0, 0($sp)
	add $a1, $a1, $t0
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	
	
		
	
	





	.data
prompt : .asciiz "Enter an integer: "
prompt_end : .asciiz "The sum is: "

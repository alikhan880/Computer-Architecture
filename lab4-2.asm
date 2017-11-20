	.text
	.globl main
	
	
main : 
	li $t0, 0 #letters
	li $t1, 0 #numbers
	li $t2, 0 #whitespaces
	la $a1, buffer
	
loop :
	li $v0, 12
	syscall
	sb $v0, 0($a1)
	beq $v0, 10, calculate
	addi $a1, $a1, 1
	j loop
	
	
calculate: 
	la $a0, buffer
	li $v0, 4
	syscall
	la $t4, buffer
	la $s0, 0
	j loop2

loop2 : 
	lb $t6, buffer($s0)
	beq $t6, 10, done
	beq $t6, 32, whitespace
	
	sgt $s5, $t6, 47
	slti $s6, $t6, 58
	beq $s5, $s6, number
	
	sgt $s5, $t6, 64
	slti $s6, $t6, 91
	beq $s5, $s6, letter
	
	sgt $s5, $t6, 96
	slti $s6, $t6, 123
	beq $s5, $s6, letter
	
	addi $s0, $s0, 1
	j loop2
	
	
	
letter :
	addi $t0, $t0, 1
	addi $s0, $s0, 1
	j loop2	
	
	
	
number:
	addi $t1, $t1, 1
	addi $s0, $s0, 1
	j loop2
	
whitespace:
	addi $t2, $t2, 1
	addi $s0, $s0, 1
	j loop2
	
	
done :
	li $v0, 1
	la $a0, ($t0)
	syscall
	li $v0, 4
	la $a0, endl
	syscall
	
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	li $v0, 4
	la $a0, endl
	syscall
	
	li $v0, 1
	la $a0, ($t2)
	syscall
	
	li $v0, 4
	la $a0, endl
	syscall
	
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	.data
buffer : .space 512
endl : .asciiz "\n"
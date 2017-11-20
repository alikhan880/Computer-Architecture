	.text
	.globl main
	
main:
	li $t0, 1
	lw $t1, instr_count
	la $s0, first_pass
loop : 
	bgt $t0, $t1, loopend
	li $v0, 4
	la $a0, ($s0)
	syscall
	li $v0, 4
	la $a0, delim
	syscall
	addi $s0, $s0, 22
	addi $t0, $t0, 1
	j loop
	 
loopend:

	la $s0, first_pass
	la $a0, 88($s0)
	li $v0, 4
	syscall
	li $v0, 10
	syscall 

	
	
	
	.data
instr_count: .word 9
delim : .asciiz "\n"
first_pass: .asciiz "add $2,$1,$1"
	.space 9
	.asciiz "add $3,$0,$2"
	.space 9
	.asciiz "add $3,$3,$3"
	.space 9
	.asciiz "add $4,$3,$0"
	.space 9
	.asciiz "beq $3,$0,done"
	.space 7
	.asciiz "sub $3,$1,$1"
	.space 9
	.asciiz "j loop"
	.space 15
	.asciiz "sw $2,0($0)"
	.space 10
	.asciiz "lw $1,-2($4)"
	.space 9

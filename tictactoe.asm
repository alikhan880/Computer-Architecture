	.text
	.globl main
	
main:
	li $t5, 0 #identifier of turn (0 = 1st players, 1 = 2nd players)
	j start_game
start_game:
	jal print_board
	beq $t5, 0, move_fp
	beq $t5, 1, move_sp
		
print_board:
	init:
		li $t4, 0
		addi $sp, $sp, -4 
		sw $ra, 0($sp)
	loop:
		li $v0, 11
		lb $a0, board($t4)
		syscall
		beq $t4, 2, print_newline
		beq $t4, 5, print_newline
		beq $t4, 8, end
		addi $t4, $t4, 1
		j loop
	end:
		li $v0, 4
		la $a0, newline
		syscall
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra
	
	print_newline:
		li $v0, 4
		la $a0, newline
		syscall
		addi $t4, $t4, 1
		j loop
		
			
	
move_fp:
	li $v0, 4
	la $a0, prompt_1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	jal get_x
	jal get_y
		
	li $t1, 3
	multu $t1, $s0
	mflo $t1
	addi $t1, $t1, -4
	add $t1, $t1, $s1
	lb $t2, board($t1)
	bne $t2, 46, return_to_f #if not equal to '.'
	
	li $t2, 'x' #load 'x'
	la $a3, board($t1)
	sb $t2, ($a3)
	jal check_board
	li $t5, 1
	j start_game
	
	
move_sp:

	li $v0, 4
	la $a0, prompt_2
	syscall 
	
	
	li $v0, 4
	la $a0, newline
	syscall
	
	
	jal get_x
	jal get_y
	
	li $t1, 3
	multu $t1, $s0
	mflo $t1
	addi $t1, $t1, -4
	add $t1, $t1, $s1
	lb $t2, board($t1)
	bne $t2, 46, return_to_s #if not equal to '.'
	
	li $t2, 'o' #load 'o'
	la $a3, board($t1)
	sb $t2, ($a3)
	jal check_board
	li $t5, 0
	j start_game
	
	

	
check_board:
	li $s4, 0 #counter of '.' for checking
	li $t4, 0
	iterate:
		bgt $t4, 8, go
		lb $s6, board($t4)
		beq $s6, 46, increase
		addi $t4, $t4, 1
		j iterate	
		
	go:
		j check_win
	
	increase:
		addi $s4, $s4, 1
		addi $t4, $t4, 1
		j iterate
	
	
check_win:
	#$t1, $t2, $t3, $t4,$t6, $t7
	lb $t1, board + 0
	lb $t2, board + 1
	lb $t3, board + 2
	seq $t4, $t1, 'x'
	seq $t6, $t2, 'x'
	seq $t7 ,$t3, 'x'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_first	
	
	lb $t1, board + 0
	lb $t2, board + 1
	lb $t3, board + 2
	seq $t4, $t1, 'o'
	seq $t6, $t2, 'o'
	seq $t7 ,$t3, 'o'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_second
	
	lb $t1, board + 3
	lb $t2, board + 4
	lb $t3, board + 5
	seq $t4, $t1, 'x'
	seq $t6, $t2, 'x'
	seq $t7 ,$t3, 'x'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_first	
	
	lb $t1, board + 3
	lb $t2, board + 4
	lb $t3, board + 5
	seq $t4, $t1, 'o'
	seq $t6, $t2, 'o'
	seq $t7 ,$t3, 'o'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_second
	
	lb $t1, board + 6
	lb $t2, board + 7
	lb $t3, board + 8
	seq $t4, $t1, 'x'
	seq $t6, $t2, 'x'
	seq $t7 ,$t3, 'x'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_first	
	
	lb $t1, board + 6
	lb $t2, board + 7
	lb $t3, board + 8
	seq $t4, $t1, 'o'
	seq $t6, $t2, 'o'
	seq $t7 ,$t3, 'o'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_second
	
	lb $t1, board + 0
	lb $t2, board + 3
	lb $t3, board + 6
	seq $t4, $t1, 'x'
	seq $t6, $t2, 'x'
	seq $t7 ,$t3, 'x'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_first	
	
	lb $t1, board + 0
	lb $t2, board + 3
	lb $t3, board + 6
	seq $t4, $t1, 'o'
	seq $t6, $t2, 'o'
	seq $t7 ,$t3, 'o'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_second
	
	lb $t1, board + 1
	lb $t2, board + 4
	lb $t3, board + 7
	seq $t4, $t1, 'x'
	seq $t6, $t2, 'x'
	seq $t7 ,$t3, 'x'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_first	
	
	lb $t1, board + 1
	lb $t2, board + 4
	lb $t3, board + 7
	seq $t4, $t1, 'o'
	seq $t6, $t2, 'o'
	seq $t7 ,$t3, 'o'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_second
	
	lb $t1, board + 2
	lb $t2, board + 5
	lb $t3, board + 8
	seq $t4, $t1, 'x'
	seq $t6, $t2, 'x'
	seq $t7 ,$t3, 'x'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_first	
	
	lb $t1, board + 2
	lb $t2, board + 5
	lb $t3, board + 8
	seq $t4, $t1, 'o'
	seq $t6, $t2, 'o'
	seq $t7 ,$t3, 'o'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_second
	
	lb $t1, board + 2
	lb $t2, board + 4
	lb $t3, board + 6
	seq $t4, $t1, 'x'
	seq $t6, $t2, 'x'
	seq $t7 ,$t3, 'x'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_first	
	
	lb $t1, board + 2
	lb $t2, board + 4
	lb $t3, board + 6
	seq $t4, $t1, 'o'
	seq $t6, $t2, 'o'
	seq $t7 ,$t3, 'o'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_second
	
	lb $t1, board + 0
	lb $t2, board + 4
	lb $t3, board + 8
	seq $t4, $t1, 'x'
	seq $t6, $t2, 'x'
	seq $t7 ,$t3, 'x'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_first	
	
	lb $t1, board + 0
	lb $t2, board + 4
	lb $t3, board + 8
	seq $t4, $t1, 'o'
	seq $t6, $t2, 'o'
	seq $t7 ,$t3, 'o'
	li $t1, 0
	add $t1, $t1, $t4
	add $t1, $t1, $t6
	add $t1, $t1, $t7
	beq $t1, 3, finish_with_second
	
	beqz $s4, finish_with_tie
	
	jr $ra
	
	
finish_with_first:
	jal print_board
	li $v0, 4
	la $a0, wins1
	syscall
	
	li $v0, 10
	syscall

finish_with_second:
	jal print_board
	li $v0, 4
	la $a0, wins2
	syscall
	
	li $v0, 10
	syscall		

finish_with_tie:
	jal print_board
	li $v0, 4
	la $a0, tie
	syscall 
	
	li $v0, 10
	syscall
	
			
					
return_to_f:
	j move_fp
	
return_to_s:
	j move_sp
	
		
get_x : 
	li $v0, 4
	la $a0, enter_x
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 5
	syscall
	
	sgt $k0, $v0, 3
	slti $k1, $v0, 1
	
	bne $k0, $k1, get_x
	
	move $s0, $v0
	jr $ra
	
	
get_y:
	li $v0, 4
	la $a0, enter_y
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 5
	syscall
	
	sgt $k0, $v0, 3
	slti $k1, $v0, 1
	
	bne $k0, $k1, get_y
	
	move $s1, $v0
	jr $ra
	

	.data
	
board : .asciiz "........." #board
prompt_1 : .asciiz "1st players move:"
prompt_2 : .asciiz "2nd players move:"
enter_x : .asciiz "Enter 'x' value"
enter_y : .asciiz "Enter 'y' value"
newline : .asciiz "\n"
wins1 : .asciiz "First player wins"
wins2 : .asciiz "Second player wins"
tie : .asciiz "Tie"



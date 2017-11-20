	.text
	.globl main
	
main : 
	li $t0, 0
	
	
go : 
	lb $t1, str($t0)
	beqz $t1, done
	bgt $t1, 96, capitalize
	la $a0, ($t1)
	li $v0, 11
	syscall
	addi $t0, $t0, 1
	j go
	
	
capitalize : 
	bgt $t1, 122, return
	addi $t1, $t1, -32
	la $a0, ($t1)
	li $v0, 11
	syscall
	addi $t0, $t0, 1
	j go
	

return : 
	la $a0, ($t1)
	li $v0, 11
	syscall
	addi $t0, $t0, 1
	j go
	
done :  
	li $v0, 10
	syscall
	
	
	
	
	
	.data

str : .asciiz "alikhan{} bakYtbek"

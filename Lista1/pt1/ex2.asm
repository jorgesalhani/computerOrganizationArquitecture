# 2. Leia um número inteiro fornecido pela usuária e imprima esse valor

	.data
	.align 0

msgInputUsr1: # Msg de input numérico para usuária
	.asciz "Insira um valor inteiro: "
	
msgPrintInt: # Msg de impressão de número
	.asciz "Valor digitado: "
	
	.text
	.align 2
	.globl main
	
main: # Entry-point para inserção e impressão de inteiro
	la a0, msgInputUsr1
	
	# impressão de string (a7 = 4)
	addi a7, zero, 4
	ecall
	
	# input de inteiro (a7 = 5)
	addi a7, zero, 5
	ecall
	
	# armazena input t0 <- a0
	addi t0, zero, 0			# limpar endereço t0
	add t0, zero, a0
	
	# impressão de mensagem 
	la a0, msgPrintInt
	addi a7, zero, 4
	ecall
	
	# impressão de int (a7 = 1)
	addi a7, zero, 1
	addi a0, t0, 0
	ecall
	
	# Exit code 10
	addi a7, zero, 10
	ecall
	
	
	
	
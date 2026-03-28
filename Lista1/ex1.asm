# 1. Escreva um programa que imprima uma mensagem de boas-vindas na tela

	.data		# diretiva de dados estáticos
	.align 0		# diretiva de alinhamento de memória byte a byte (char)
	
s_bv:	# String de boas vindas
	.asciz	"Boas vindas!!" 
	
	.text		# diretiva de início de código
	.align 2		# diretiva de alinhamento de limite de memória byte-wise (word: 4bytes)
	.globl main	# diretiva de rótulo de referência para função de entrada (entry-point)
	
main:	# Função main para impressão 
	#  de mensagem de boas-vindas
	
	la a0, s_bv		# a0 : registrador de argumentos de função / retorno
				# Carregar string ao end. a0
				
	addi a7, zero, 4		# a7 : registrador para syscalls
				# 4  : op indicativo de print string
	ecall
	
	addi a7, zero, 10	# 10 : op indicativo de exit code 10
	ecall
	

	
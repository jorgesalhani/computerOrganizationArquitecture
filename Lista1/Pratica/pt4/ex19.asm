# 19. Leia N números inteiros e armazene-os em memória

	.data
	.align 0
	
msgInput:
	.asciz "Insira o total de inteiros que serão informados (N): "
	
	.align 2
arrayInt:
	# Limitar espaço para 100 ints (4bytes cada)
	.space 400 
	
	.text
	.align 2
	.globl main
	
main:
	# Obtenção de N números inteiros
	jal obterInput
	
	# iterador
	addi t0, zero, 0
	
	# Posição inicial do array
	la t1, arrayInt
	
	# Laço para leitura e armazenamento de N inteiros
	jal salvarNInt
	
	# Finalização
	j finalizar
	
finalizar:
	# Finalização code 10
	addi a7, zero, 10
	ecall
	
obterInput:
	# Obter total de valores inteiros informados N
	# Retorno
	#  a1: valor inserido N
	
	# Msg input
	la a0, msgInput
	addi a7, zero, 4
	ecall 
	
	# Obter N
	addi a7, zero, 5
	ecall
	
	# Salvar em a1
	add a1, zero, a0
	
	# Retornar
	jr ra
	
salvarNInt:
	# Laço para inserção e armazenamento de N inteiros
	# Args:
	#  a1: total de ints N
	#  t0: iterador
	#  t1: próxima posição do array para armazenamento

	# Condição de saída: 
	#  t0 >= N
	bge t0, a1, fimSalvarInt # if t0 >= N: fim
	
	# Receber int
	addi a0, zero, 5
	ecall
	
	# Salvar no array
	sw a0, 0(t1)
	
	# Incrementar t0++
	addi t0, t0, 1
	
	# Incrementar t1 += 4 (int bytes)
	addi t1, t1, 4
	
	# Receber novo valor
	j salvarNInt
	
fimSalvarInt:
	# Finalização de N inserções
	jr ra

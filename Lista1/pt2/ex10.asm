# 10. Leia um número N e calcule a soma de todos os números de 1 até N

	.data
	.align 0
	
msgUsrInputN:
	.asciz "Insira um número inteiro (N): "
	
msgResult:
	.asciz "Soma de 1 a N: "
	
	.text
	.align 2
	.globl main
	
main:
	# Função para calcular a soma dos valores de 1 a N
	
	# Imprimir msg de usuária
	la a0, msgUsrInputN	# a0 = msgN
	addi a7, zero, 4
	ecall			# print(msgN)
	
	# Get input int
	addi a7, zero, 5
	ecall			# a0 = <inputN>
	
	# Salvar N
	add s0, zero, a0		# s0 = a0
	
	# Temporário incremental
	addi t0, zero, 1		# t0 = 1
	
	# Resultado de soma
	addi t1, zero, 0		# t1 = 0
	
loop1toN:
	# Laço para calcular soma 1 a N
	#  condição de entrada: default
	#  condição de saída: t0 > s0
	
	# caso de saída
	bgt t0, s0, endLoopN	# if t0 > s0: end
	
	# Acumular soma
	add t1, t1, t0		# t1 += t0
	
	# Incrementar t0
	addi t0, t0, 1		# t0 += 1

	# Volta ao loop
	j loop1toN
	
endLoopN:
	# Saída de laço
	
	# Imprimir msg resultado
	la a0, msgResult		# a0 = msgRes
	addi a7, zero, 4
	ecall			# print(msgRes)
	
	# Imprimir resultado
	add a0, zero, t1		# a0 = t1
	addi a7, zero, 1
	ecall			# print(t0)
	
	# Exit
	addi a7, zero, 10
	ecall			# exit()
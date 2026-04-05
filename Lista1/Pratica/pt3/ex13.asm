# 13. Leia um número N e imprima os N primeiros termos da sequência de Fibonacci

	.data
	.align 0
	
msgUsrInN:
	.asciz "Insira um número inteiro N: "
	
msgResp:
	.asciz "Fibonacci (N): "
	
msgRespSep:
	# Msg suporte como separador de valores
	.asciz ", "
	
	.text
	.align 2
	.globl main

main:
	# Função para obter os N primeiros termos de Fibonacci
	
	# Print msg usuária
	la a0, msgUsrInN		# a0 = msgN
	addi a7, zero, 4
	ecall			# print(msgN)
	
	# Obter int
	addi a7, zero, 5
	ecall			# a0 = <inputN>
	
	# Salvar N
	add s0, zero, a0		# s0 = a0
	
	# Set temporário para incrementar
	addi t0, zero, 1		# t0 = 1
	
	# Set valor inicial de Fibo
	addi a1, zero, 1		# a1 = 0
	
	# Set valores anteriorrs da seq Fibonacci	
	addi a2, zero, 1		# a2 = 0
	addi a3, zero, 1		# a3 = 1
	
	# Print msg suporte de resultado
	la a0, msgResp		# a0 = msgResp
	addi a7, zero, 4
	ecall			# print(msgResp)
	
	# Print valor 1 inicial
	add a0, zero, a1		# a0 = a1
	addi a7, zero, 1
	ecall			# print(a1)
	
	# Print msg suporte de resultado
	la a0, msgRespSep	# a0 = msgSep
	addi a7, zero, 4
	ecall			# print(msgSep)
	
	
loopFiboN:
	# Loop para obter N valores de Fibonacci
	#  Condição de entrada: default
	#  Condição de saída: t0 >= N
	
	bge t0, s0, endFiboN	# if t0 >= s0: end
	
	add a0, zero, a1		# a0 = a1
	addi a7, zero, 1
	ecall			# print(a1)
	
	# Print msg suporte de resultado
	la a0, msgRespSep	# a0 = msgSep
	addi a7, zero, 4
	ecall			# print(msgSep)
	
	# Calcular próximo val de seq Fib
	add a1, a2, a3		# a1 = a2 + a3
	
	# Set a2 como a3
	add a2, zero, a3		# a2 = a3
	
	# Set a3 como valor atual da seq Fib
	add a3, zero, a1		# a3 = a1
	
	# Incrementar contador t0
	addi t0, t0, 1		# t0 += 1
	
	# Retorna ao loop
	j loopFiboN
	
endFiboN:
	# Saída de loop
	# Exit
	addi a7, zero, 10
	ecall			# exit()
	
	

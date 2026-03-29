# 11. Leia um número inteiro e determine se ele é primo

	.data
	.align 0
msgUsrInA:
	.asciz "Insira um número inteiro N: "
	
msgRespPrime:
	.asciz "Primo"
	
msgRespNPrime:
	.asciz "Não é primo"
	
	.text
	.align 2
	.globl main
	
main:
	# Função para determinar se número inteiro N é primo
	
	# Print msg usuária
	la a0, msgUsrInA		# a0 = msgA
	addi a7, zero, 4
	ecall			# print(msgA)
	
	# Get input int
	addi a7, zero, 5
	ecall			# a0 = <inputA>
	
	# Fixar 1, 2 como primos
	addi a1, zero, 1		# a1 = 1
	addi t0, zero, 2		# t0 = 2
	
	# Se 0: não primo
	beq a0, zero, notPrime	# if a0 == 0: notPrime
	
	# Se 1, 2: primo
	ble a0, t0, isPrime	# if a0 <= 2: isPrime
	
	# Save A
	add s0, zero, a0		# s0 = a0
	
	# Verificar se par
	andi t0, a0, 1		# t0 = a0 & 1
	beq t0, zero, notPrime 	# if t0 == 0: notPrime
	
	# Se ímpar, buscar se resto de divis por t1 (iterador)
	#  é igual a 0 até s0
	
	# Set iterador
	addi t1, zero, 3		# t1 = 3
	
loopCheckDivisRest:
	# Loop para verificação de resto de divisão de t1 % N
	#  condição de entrada: default
	#  condição de saída:
	#	se t1 > N: 	primo
	#	se t1 % N == 0: não primo
	
	# 	otimização: 
	#	se t1*t1 > N:	primo
	
	mul t2, t1, t1		# t2 = t1 * t1
	bgt t2, s0, isPrime	# if t1*t1 > N: isPrime
	
	# Verificar resto de divisão
	rem t3, s0, t1		# t3 = s0 % t1 (= N % i)
	beq t3, zero, notPrime	# if s0%t1 == 0: notPrime
	
	# Incrementar t1
	addi t1, t1, 2		# t1 += 2 (ímpares)

	# Voltar ao laço
	j loopCheckDivisRest
	
isPrime:
	# Print suporte para primos
	la a0, msgRespPrime	# a0 = msgPrm
	addi a7, zero, 4
	ecall			# print(msgPrm)
	j exitProgram
	
notPrime:
	# Print suporte para não primos
	la a0, msgRespNPrime	# a0 = msgNPrm
	addi a7, zero, 4
	ecall			# print(msgNPrm)
	j exitProgram

exitProgram:
	# Exit
	addi a7, zero, 10
	ecall			# exit()
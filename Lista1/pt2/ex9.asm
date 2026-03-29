# 9. Leia um número inteiro e imprima sua tabuada de 1 a 10

	.data
	.align 0

msgUsrInputA:
	.asciz "Insira um valor numério (N): "
msgRespSep1:
	.asciz " x "
msgRespSep2:
	.asciz " = "
msgRespSep3:
	.asciz "\n"

	.text
	.align 2
	.globl main
	
main:
	# Função para calcular tabuada de 1 a 10
	
	# imprimir msg inicial
	la a0, msgUsrInputA	# a0 = msgA
	addi a7, zero, 4
	ecall 			# print(a0)
	
	# get input N
	addi a7, zero, 5
	ecall			# a0 = <inputN>
	
	# salvar N
	add s0, zero, a0		# s0 = a0
	
	# set variável incremental
	addi t0, zero, 1		# t0 = 1
	
	# set variável fixa 10
	addi t1, zero, 10	# t1 = 10
	
loop1toN:
	# Laço para calcular tabuada
	#  condição de entrada: default
	#  condição de saída: t0 > 10
	bgt t0, t1, endLoopN	# if t0 > t1: end
	
	# imprimir linha tabuada
	#  s0 x t0 = result\n
	add a0, zero, s0		# a0 = s0
	addi a7, zero, 1
	ecall			# print(s0)
	
	la a0, msgRespSep1	# a0 = msgR1
	addi a7, zero, 4
	ecall			# print(msgR1)
	
	add a0, zero, t0		# a0 = t0
	addi a7, zero, 1
	ecall			# print(t0)
	
	la a0, msgRespSep2	# a0 = msgR2
	addi a7, zero, 4
	ecall			# print(msgR2)
	
	mul a0, s0, t0		# a0 = s0*t0
	addi a7, zero, 1
	ecall			# print(res)
	
	la a0, msgRespSep3	# a0 = msgR3
	addi a7, zero, 4
	ecall			# print(msgR3)
	
	# incremento t0
	addi t0, t0, 1		# t0 += 1
	
	# volta ao loop
	j loop1toN
	
endLoopN:
	# Saída do laço
	
	# Exit
	addi a7, zero, 10
	ecall			# exit
	
	
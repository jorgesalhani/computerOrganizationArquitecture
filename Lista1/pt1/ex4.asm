# 4. Leia um número inteiro e imprima o seu dobro e seu triplo

	.data
	.align 0

strUsrInputA:	# Msg de input para usuaria
	.asciz "Insira um valor inteiro: "
	
msgResp1:	# Msg de resposta1
	.asciz "\n x "
	
msgResp2:	# Msg de resposta2
	.asciz "= "

msgResp3:	# Msg de resposta3
	.asciz "\n"
	
	.text
	.align 2
	.globl main
	
main:	# Entry point: Cálculo de dobro e triplo de um número inteiro
	
	# Carregar conteúdo de msgA
	la a0, strUsrInputA		# a0 = msgA
	
	# Imprimir msgA
	addi a7, zero, 4			# a7 = 4 (print str)
	ecall				# print(msgA)
	
	# Obter input inteiro A
	addi a7, zero, 5			# a7 = 5 (input int)
	ecall				# a0 = <inputA>
	
	# Calcular dobro
	addi a1, zero, 2
	mul t0, a0, a1			# t0 = a0 * 2
	
	# Calcular triplo
	addi a1, zero, 3
	mul t1, a0, a1			# t1 = a0 * 3
	
	# Imprimir resultados
	#  formato: a0 
	#	     x 1 = t0 
	#	     x 2 = t1
	
	addi a7, zero, 1			# a7 = 1 (print int)
	ecall				# print(a0)
	
	la a0, msgResp1
	addi a7, zero, 4			# a7 = 4 (print str)
	ecall				# print(msg1)
	
	addi a0, zero, 1			# a0 = 1
	addi a7, zero, 1			# a7 = 1 (print int)
	ecall				# print(1)
	
	la a0, msgResp2
	addi a7, zero, 4			# a7 = 4 (print str)
	ecall				# print(msg2)
	
	add a0, zero, t0
	addi a7, zero, 1			# a7 = 1 (print int)
	ecall				# print(t0)
	
	la a0, msgResp1
	addi a7, zero, 4			# a7 = 4 (print str)
	ecall				# print(msg1)
	
	addi a0, zero, 2
	addi a7, zero, 1			# a7 = 1 (print int)
	ecall				# print(2)
	
	la a0, msgResp2
	addi a7, zero, 4			# a7 = 4 (print str)
	ecall				# print(msg2)
	
	add a0, zero, t1
	addi a7, zero, 1			# a7 = 1
	ecall				# print(t1)
	
	# Exit 10
	addi a7, zero, 10		# a7 = 10
	ecall				# exit()
	
	
	
	
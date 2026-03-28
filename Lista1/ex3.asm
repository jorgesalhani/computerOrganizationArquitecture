# 3. Leia dois números inteiros e imprima o resultado da soma entre eles

	.data
	.align 0		# Alinhamento para char (2^0 = 1 byte)
	
msgUsrInputA: # Msg para inserção de valor A
	.asciz "Insira um número (A): "
	
msgUsrInputB: # Msg para inserção de valor B
	.asciz "Insira um número (B): "
	
msgResult: # Msg resultado A+B
	.asciz "Resultado (A+B): "
	
	.text
	.align 2
	.globl main
	
main:	# Entry point
	# Código para leitura de inteiros e resultado de soma A+B
	
	# Msg input A
	la a0, msgUsrInputA	# Carregar msg A
	addi a7, zero, 4 	# Opcode a7=4 (print string)
	ecall			# print(msgA)
	
	# Armazenamento input int A
	addi a7, zero, 5		# Opcode a7=5 (read int)
	ecall			# a0 = <inputA>
	
	addi t0, a0, 0		# Armazenamento temporario t0 <- a0
	
	# Msg input B
	la a0, msgUsrInputB	# Carregar msg B
	addi a7, zero, 4		# Opcode a7=4 (print string)
	ecall			# print(msgB)
	
	# Armazenamento input int B
	addi a7, zero, 5		# Opcode a7=5 (read int)
	ecall			# a0 = <inputB>
	
	add t1, zero, a0		# Armazenamento temporario t1 <- a0
	
	# Msg final
	la a0, msgResult		# Carregar msg A+B
	addi a7, zero, 4		# Opcode a7=4 (print str)
	ecall			# print(msgRes)
	
	# Operar soma A+B
	#  armazenando resultado em a0
	add a0, t0, t1		# a0 = t0 + t1
	
	# Msg final com resultado A+B
	addi a7, zero, 1		# Opcode a7=1 (print int)
	ecall			# print(A+B)
	
	# Exit code 10
	addi a7, zero, 10	# Opcode a7=10 (exit)
	ecall			# exit 10

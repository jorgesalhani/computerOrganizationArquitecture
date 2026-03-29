# 6. Leia dois números inteiros e imprima o maior deles

	.data
	.align 0
	
msgUsrInputA:
	.asciz "Insira um número inteiro A: "
	
msgUsrInputB:
	.asciz "Insira um número inteiro B: "
	
msgRes:
	.asciz "O maior é: "
	
	.text
	.align 2
	.globl main
	
main:
	# Msg input A
	la a0, msgUsrInputA	# a0 = msgA
	addi a7, zero, 4		# op print str
	ecall			# print(a0)
	
	# Obter int A
	addi a7, zero, 5		# op input int
	ecall			# a0 = <inputA>
	
	# salvar input A
	add t0, zero, a0		# t0 = a0
	
	# Msg input B
	la a0, msgUsrInputB	# a0 = msgB
	addi a7, zero, 4		# op print str
	ecall			# print(a0)
	
	# Obter int B
	addi a7, zero, 5		# op input int
	ecall			# a0 = <inputB>
	
	# salvar input B
	add t1, zero, a0		# t1 = a0
	
	# PrintMsg resp (sem valor final)
	la a0, msgRes		# a0 = msgRes
	addi a7, zero, 4		# op print str
	ecall			# print(a0)
	
	bge t1, t0, if_greater
	
	# Msg result t0
	add a0, zero, t0		# a0 = t0
	addi a7, zero, 1		# op print int
	ecall
	
	# Exit
	addi a7, zero, 10	# op exit
	ecall
	
if_greater:
	# Caso t1 > t0
	
	# Msg result tt
	add a0, zero, t1		# a0 = t1
	addi a7, zero, 1		# op print int
	ecall
	
	# Exit
	addi a7, zero, 10	# op exit
	ecall
	
	
	
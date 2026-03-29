# 5. Leia um número inteiro e informe se ele é par ou ímpar

	.data
	.align 0

msgUsrInputA:
	.asciz "Insira um número inteiro: "
	
msgRespEven:
	.asciz "Par"

msgRespOdd:
	.asciz "Ímpar"
	
	.text
	.align 2
	.globl main
	
main:
	# Imprimir msg inicial
	la a0, msgUsrInputA	# a0 = msgA
	addi a7, zero, 4		# op print str
	ecall			# print(msgA)
	
	# Obter inteiro
	addi a7, zero, 5		# op input int
	ecall			# a0 = <input>
	
	# Verificar paridade
	andi t0, a0, 1		# t0 = a0 & 1
	
	beq t0, zero, if_even	# if t0 == 0:
	
	# Imprimir msg imper
	la a0, msgRespOdd	# a0 = msgOdd
	addi a7, zero, 4		# op print str
	ecall			# print(a0)
	
	# Exit 
	addi a7, zero, 10	# op exit
	ecall			# exit
	
if_even:
	# Condicional para caso t0 & 1 = 0
	
	# Imprimir msg par
	la a0, msgRespEven	# a0 = msgEven
	addi a7, zero, 4		# op print str
	ecall			# print(a0)
	
	# Exit
	addi a7, zero, 10	# op exit
	ecall
	
	
	
# 8. Leia um número N e imprima todos os número de N até 1

	.data
	.align 0

msgUsrInputA:
	.asciz "Insira um valor inteiro N: "
	
msgRespSep:
	# Separador para resultado de lista numerica
	.asciz ", "

	.text
	.align 2
	.globl main

main:
	# Função para imprimir números de N a 1
	
	# Imprimir msg usr
	la a0, msgUsrInputA	# a0 = msgA
	addi a7, zero, 4		# op print str
	ecall			# print(a0)
	
	# Obter inteiro
	addi a7, zero, 5		# op input int
	ecall			# a0 = <inputA>
	
	# Salvar valor inserido
	add t0, zero, a0		# t0 = a0
	
	# Carregar valor fixo de comparação: 1
	addi t1, zero, 1		# t1 = 1
	
	# Inicio de loop (do-while)
loopNto1:
	# Condição de saída: t0 < 1
	
	blt t0, t1, endLoopN	# if t0 < 1
	
	# Imprimir valor
	add a0, zero, t0		# a0 = t0
	addi a7, zero, 1		# op print int
	ecall			# print(a0)
	
	# Imprimir separador
	la a0, msgRespSep	# a0 = msgSep
	addi a7, zero, 4		# op print str
	ecall			# print(a0)
	
	# Decrementar t0
	addi t0, t0, -1		# t0 = t0 - 1

	# voltar ao laço
	j loopNto1
	
endLoopN:
	# Fim do loop: t0 = 1
	
	# Exit
	addi a7, zero, 10	# op exit
	ecall
	

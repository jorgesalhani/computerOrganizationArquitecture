# 7. Leia um número N e imprima todos os número de 1 até N

	.data
	.align 0
	
msgUsrInputN:
	.asciz "Insira um valor inteiro N: "
	
msgRespSep:
	# Msg de separação entre valores impressos
	.asciz ", "
	
	.text
	.align 2
	.globl main
	
main:
	# Imprimir msg input N
	la a0, msgUsrInputN 	# a0 = <msgN>
	addi a7, zero, 4		# op print str
	ecall			# print(a0)
	
	# Obter inteiro N
	addi a7, zero, 5		# op input int
	ecall			# a0 = <inputN>
	
	# Salvar input
	add t0, zero, a0	# t0 = a0
	
	# Inicializar var incremental t1
	addi t1, zero, 0		# t1 = 0
	
forItoN:
	# Loop enquanto t1 <= N
	bgt t1, t0, endForN
	
	# Imprimir valor incremental
	add a0, zero, t1		# a0 = t1
	addi a7, zero, 1		# op print int 
	ecall
	
	# Imprimir separador
	la a0, msgRespSep	# a0 = msgSep
	addi a7, zero, 4		# op print str
	ecall
	
	# incrementar t1
	addi t1, t1, 1		# t1 = t1 + 1
	
	# retornar ao inicio do laço
	j forItoN
	
endForN:
	# Fim do loop: t0 == N
	
	# Exit code
	addi a7, zero, 10	# op exit
	ecall			# exit
	
	
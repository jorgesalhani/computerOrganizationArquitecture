# 15. Leia um número inteiro e imprima seu valor invertido

	.data
	.align 0
strInput:
	.asciz "Insira um número inteiro (N): "
strResp:
	.asciz "Valor invertido de N: "
	
	.text
	.align 2
	.globl main
	
main:
	jal usr_input
	# a1: valor inserido
	
	jal invert_digits
	# a2: valor invertido
	
	jal print_result
	
	j end_program	

end_program:
	# Exit program
	addi a7, zero, 10
	ecall
	
print_result:
	# Imprime resultado
	# Args:
	#  a2: valor invertido
	
	# Print msg
	la a0, strResp
	addi a7, zero, 4
	ecall
	
	# Print resultado
	add a0, zero, a2
	addi a7, zero, 1
	ecall
	
	jr ra

usr_input:
	# Obtem input
	# Retorno:
	#  a1: valor inserido
	#  a2: acumulador
	
	# Print msg
	la a0, strInput
	addi a7, zero, 4
	ecall
	
	# Obter int
	addi a7, zero, 5
	ecall
	
	# salvar em a1
	add a1, zero, a0
	
	# definir acumulador
	addi t0, zero, 1
	
	addi s0, zero, 10 # s0 = 10 (fixo)
	
	jr ra
	
invert_digits:
	# Inverter dígitos de um inteiro
	# Args:
	#  a1: valor inserido
	#  t0: acumulador base 10 (=1 init)
	#  s0: fixo 10
	# Ret:
	#  a2: valor invertido
	
	# Obter ultimo digito
	rem t2, a1, s0 # t2 = a1 % 10
	
	# Deslocar 10x valor atual
	mul a2, a2, s0
	
	# Incrementar como unidade o último valor obtido
	add a2, a2, t2
	
	# Remover último digito 
	div a1, a1, s0 # a1 = a1 / 10
	
	# Incremento
	mul t0, t0, s0 # t0 = t0 * 10
	
	# Caso de saída: a1 == 0
	bne a1, zero, invert_digits # if a1 != 0: invert
	
	jr ra
	

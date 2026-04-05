# 14. Leia um número inteiro e informe quantos dígitos ele possui

	.data
	.align 0
	
strInput:
	.asciz "Insira um número inteiro (N): "
strResp:
	.asciz "Número de dígitos de N: "
	
	.text
	.align 2
	.globl main
	
main:
	la a0, strInput
	addi a7, zero, 4
	ecall # print(strIn)
	
	addi a7, zero, 5
	ecall # a0 = <input>
	
	add t0, zero, a0 # t0 = a0
	
	# t1: contador
	addi t1, zero, 0
	
	# a1: divisor fixo = 10
	addi a1, zero, 10
	
	bne t0, zero, count_loop # if t0 != 0: count_it
	
	# Print final
	j print_result
	
count_loop:
	# Laço para divisão por 10
	# Argumentos:
	#  t0: valor inserido
	#  t1: contador (=0)
	#  a1: valor fixo (=10)
	#
	# Caso base:
	#  se t0 != 0, então continuamos dividindo
	# Ao fim, print total
	#
	# Retorno:
	#  null
	div t0, t0, a1 # t0 = t0 / 10
	addi t1, t1, 1 # t1 += 1
	bne t0, zero, count_loop
	j print_result

print_result:
	la a0, strResp
	addi a7, zero, 4
	ecall
	
	add a0, zero, t1
	addi a7, zero, 1
	ecall
	
	
	
	
	
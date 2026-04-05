# 20. Imprima todos os elementos de um vetor previamente armazenado

	.data
	.align 0

msgResult:
	.asciz "Array pré definido: "
msgSep:
	.asciz ", "
	
	.align 2
intArray:
	.word 10,20,23,1,3,5,123,8283
sizeArray:
	.word 8
	
	.text
	.align 2
	.globl main
	
main:
	# Msg resposta
	jal printMsg
	
	# Inicializaçao de argumentos
	jal setArgsPrintInt
	
	# Print para cada int
	jal printInt
	
	# Finaliza
	jal finalizar
	
finalizar:
	# Exit code 10
	addi a7, zero, 10
	ecall
	
printMsg:
	# Print mensagem de resultado
	la a0, msgResult
	addi a7, zero, 4
	ecall
	
	jr ra
	
setArgsPrintInt:
	# Set argumentos para função seguinte: printInt
	# Retorno
	#  t0: contador (= 0)
	#  t1: End posição atual do array (= 0(array))
	#  a1: total de inteiros armazenados (= N)
	
	# Set contador
	addi t0, zero, 0
	
	# Set end posição inicial do array
	la t1, intArray
	
	# Set total de inteiros armazenados N
	la a0, sizeArray
	lw a1, 0(a0)
	
	# Retorno
	jr ra
	
printInt:
	# Enquanto houve inteiro no array, imprimir
	# Args:
	#  t0: contador
	#  t1: End posição atual do array
	#  a1: total de inteiros armazenados
	
	# Caso de saída:
	#  t0 >= a1
	bge t0, a1, endPrintInt
	
	# Print int
	lw a0, 0(t1)
	addi a7, zero, 1
	ecall
	
	# Print separator
	la a0, msgSep
	addi a7, zero, 4
	ecall
	
	# Incrementar posição de mem
	addi t1, t1, 4
	
	# incrementar contador
	addi t0, t0, 1
	
	j printInt
	
endPrintInt:
	# Retorna para chamada original
	jr ra
	
	

	

	
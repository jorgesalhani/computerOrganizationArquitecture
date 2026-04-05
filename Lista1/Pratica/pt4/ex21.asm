# 21. Encontre o maior valor em um vetor

	.data
	.align 0
	
msgInput:
	.asciz "Insira o total de inteiros a ser inseridos (N): "
	
msgResult:
	.asciz "Maior valor do array: "
	
	.align 2
	
arrayInt:
	# Total de 100 ints
	.space 400
	
	.text
	.align 2
	.globl main
	
main:
	# Print msg inserir N
	jal printMsgInputN
	
	# s1 = N
	
	# Set argumentos para obter inteiros e armazenar no array
	jal setArgsGetValoresInt
	
	# Obter inteiros
	jal getValoresInt
	
	# Set argumentos para iterar e buscar maior
	jal setArgsBuscarMaior
	
	# Iterar em array para buscar maior
	jal buscarMaior
	
	# Imprimir maior valor
	jal printMaior
	
	# Exit
	jal finalizar
	
printMaior:
	# Imprimir maior valor encontrado
	# Args:
	#  a1: Maior valor encontrado
	
	# Print msg result
	la a0, msgResult
	addi a7, zero, 4
	ecall
	
	# Print int
	add a0, zero, a1
	addi a7, zero, 1
	ecall
	
	# Retornar
	jr ra
	
finalizar:
	# Finalizar programa
	addi a7, zero, 10
	ecall
	
printMsgInputN:
	# Print mensagem de input
	# Retorno:
	#  s1: Total de valores a inserir N
	la a0, msgInput
	addi a7, zero, 4
	ecall
	
	# Obter N
	addi a7, zero, 5
	ecall
	
	# Set valor para s1
	add s1, zero, a0
	
	# Retornar
	jr ra
	
setArgsGetValoresInt:
	# Set argumentos para próxima rotina: getValoresInt
	# Retorno:
	#  t0: Acumulador (=0)
	#  t1: End inicial do array de ints (=0(arrayInt))
	
	# Set acumulador
	addi t0, zero, 0
	
	# Set end inicial do array
	la t1, arrayInt
	
	# Retornar
	jr ra
	
getValoresInt:
	# Obter em loop valores inseridos por usuaria
	# Args:
	#  s1: Total de valores para inserir N
	#  t0: Acumulador
	#  t1: End atual do array de ints
	
	# Caso de saída: t0 >= s1
	bge t0, s1, endGetValoresInt
	
	# Obter inteiro
	addi a7, zero, 5
	ecall
	
	# Armazenar em memoria
	sw a0, 0(t1)
	
	# Incrementar posição de deslocamento do array
	addi t1, t1, 4
	
	# Incrementar t0
	addi t0, t0, 1
	
	# Retomar loop
	j getValoresInt
	
endGetValoresInt:
	# Finalizar loop e retornar ao original
	jr ra
	
setArgsBuscarMaior:
	# Set de argumentos para rotina seguinte: buscarMaior
	# Retorno
	#  t0: Acumulador (=0)
	#  t1: End inicial do array (=0(arrayInt))
	#  s1: Total de valores inteiros
	#  a1: Variável do maior valor corrente (= 0)
	
	# Set acumulador
	addi t0, zero, 0
	
	# Set temp de maior valor atual
	addi a1, zero, 0
	
	# Set end inicial do array
	la t1, arrayInt
	
	# Retornar
	jr ra
	
buscarMaior:
	# Buscar maior valor inserido no array de ints
	# Args:
	#  t0: Acumulador
	#  t1: End atual do array de ints
	#  a1: Variável do maior valor corrente
	
	# Caso de saída: t0 >= s1
	bge t0, s1, endBuscarMaior
	
	# Obter inteiro atual
	lw a0, 0(t1)
	
	# Substituir a1 caso a0 seja maior
	bgt a0, a1, subCasoMaior

voltarCasoMaior:
	# Incrementar end atual do array
	addi t1, t1, 4
	
	# Incrementar acumulador
	addi t0, t0, 1
	
	# Retomar loop
	j buscarMaior
	
endBuscarMaior:
	# Finaliza laço de busca
	jr ra
	
subCasoMaior:
	# Substituir variável caso novo maior encontrado
	# Args:
	#  a0: Novo maior
	#  a1: Atual maior
	
	add a1, zero, a0
	
	# Retornar ao fluxo normal de iteração para buscar novo maior
	j voltarCasoMaior
	
	
	
	
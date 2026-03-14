# LABEL 			COMMAND 			COMMENT
# =====================================================================
				.text				# seção de texto (código)
				.align 2			# alinhar código a 2^n (2^2)
				
				.globl main			# declarar função principal (entry)
main:
								# ======== SUBROTINA: START =============
				addi sp, sp, -16		# alocar quadro de pilha (stack ptr)
								#  ----- PRÓLOGO -----
								#  regride 16 bytes da posição inicial da pilha
								#  permite ter um espeço 'privado' de memória (stack frame)

				sw ra, 12(sp)			# salvar endereço de retorno (return addr)	
								#  acima, regredimos 16 bytes (4 posições com 4 bytes por slot)
								#  ao salvar a posição 12 de "sa", apontamos para a base da pilha
								#  cuja posição possui slots 12, 13, 14, 15 (preenchendo os 16 bytes)
				
				lui a0, %hi(palavra_1)		# carregar "palavra_1" e armazenar nos 20 bits mais
								#  significativos (load upper immediate)
								#  RISCV limita a endereços de 32 bits, então precisamos
								#  quebrar a palavra em endereços distintos. Como se fosse paginação!!
								
				addi a0, a0, %lo(palavra_1)	# somar ao valor corrente de "a0" os bits menos significativos
								#  agora "a0" contém o endereço completo de "palabra_1"
								
				lui a1, %hi(palavra_2)		# carregar "palavra_2" e armazenar nos 20 MSB (Most Significant bits)
				
				addi a1, a1, %lo(palavra_2)	# somar ao valor corrente de "a1" os LSB (Least Significant bits)
								
				# call printf			# chamar função printf [ERROR!!!]
				addi a7, x0, 4			#  insere em 'a7' codigo 4 (print)
				ecall
				
				lw ra, 12(sp)			# restaurar quadro de pilha (stack frame acima)
								#  ----- EPÍLOGO -----
								#  aqui copiamos de volta a posição da base da pilha para "ra"
				
				addi sp, sp, 16			# desalocar quadro de pilha
								#  aqui avançamos os 16 byts que regredimos no prólogo,
								#  reposicionando o endereço para o início 'oficial' da pilha
								
				li a0, 0			# resetar 'a0' ao valor 0
				
				ret				# retornar de subrotina
								# ======== SUBROTINA: END =============
								
				.section .rodata		# Seção de dados de leitura (Read Only)
				#.balign 4			# alinhar seção de dados para slot de 4 bytes consecutivos  [ERROR!!]
				.align 2

palavra_1:
				.string "Hello, %s!\n"		# string terminada com nulo
palavra_2:
				.string "world"			# string terminada com nulo
				
				
				
				
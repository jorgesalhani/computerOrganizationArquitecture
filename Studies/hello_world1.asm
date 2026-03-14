# LABEL			COMMAND			COMMENT
# =========================================================================================
			.data			# diretiva para inicio do segmento de dados
# Segmento de dados =======================================================================
			.align 0		# avançar o contador de local até uma fronteira de 0 bytes (char)
hello_str:		.asciz "Hello World!"	# armazenar 
			.align 2		# avançar o contador de local até uma fronteira de 2 bytes (int)
vlr_int:		.word 157		# armazenar palavra (listed values) de 32 bits subsequentes

			.text			# diretiva para início do segmento de texto (código)
# Segmento de texto =======================================================================
			.globl main		# diretiva para usar rotulo em outro programa (entry-point)

main: 						# rótulo de início (entry)
			.align 2		# contador de local para fronteira. Armazenar 32 bits (int)
			addi a7, x0, 4		# código do serviço 4 (print str)
			la a0, hello_str	# carregar endereço do 1º byte da string
			ecall 		 	# executa system call especificado em a7
			
			addi a7, x0, 10		# código de serviço 10 (exit)
			ecall 			# executa system call especificado em a7




		
	
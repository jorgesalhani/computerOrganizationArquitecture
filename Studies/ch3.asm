# Studies from An Introduction to Assembly Programming with RISC-V
# - Autor: Prof. Edson Borin (UNICAMP)
# ==============================

	.text
	.globl start
	
start:
	li a0, 10	# load 10 into a0
	li a1, 20	# load 20 into a1
	
	li a7, 1	# print int (code 1 to a7)
	ecall		# system call
			# > 10 (printed content at a0)
			
	mv a0, a1	# move value of a1 into a0
			#  pseudo-instruction to 'addi a0, a1, 0'
	li a7, 1	# print int (code 1 to a7)
			#  not necessary. a7 has 1 already
	ecall
		
	jal exit	# jump and link to routine 'exit'

exit:			# labeled routine 'exit'
	li a0, 0	# load 0 to a7 (reset argument)
	li a7, 93	# exit (code 93 to a7)
	ecall		# system call
	

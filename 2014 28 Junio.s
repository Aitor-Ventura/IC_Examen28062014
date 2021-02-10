			.data
V:		.word 3,2,4,3,1,5,3,2,5
res:	.space 4
cuenta:	.space 4

			.text
main:	la $t0,V		#t0 carga la direccion de V
		li $t1,1		#t1 = i = 1
		li $t2,9		#t2 = num elem
		li $t3,2		#t3 comprueba si son pares
		li $t4,3		#t4 comprueba si V[i]>3
		li $t5,0		#t5 = suma
		li $t6,0		#t6 = cuenta
		#s0 = V[i]
		#s1 almacena el resto de la división
		
para:	bgt $t1,$t2,finpara	#cuando i>num elem, salta a finpara
		lw $s0,0($t0)
		
		div $s0,$t3
		mfhi $s1
		beq $s1,$0,entonces	#si el resto es 0, saltamos a entonces
		
		ble $s0,$t4,finsi	#V[i] > 3
		
entonces:	add $t5,$t5,$s0	#suma = suma + V[i]
			addi $t1,$t1,1	#avanzamos en i
			addi $t0,$t0,4	#avanzamos en palabras
			j para
			
finsi:		addi $t6,$t6,1	#cuenta = cuenta + 1
			addi $t1,$t1,1	#avanzamos en i
			addi $t0,$t0,4	#avanzamos en palabras
			j para

finpara:	sw $t5,res
			sw $t6,cuenta
			jr $31
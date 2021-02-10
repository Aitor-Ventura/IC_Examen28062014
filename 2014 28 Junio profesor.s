.data

v: .word 3, 2, 4, 3, 1, 5, 3, 2, 5
suma: .space 4
cuenta: .space 4

.text

main: add $t0,$0,$t0   #t0(suma)= 0
      add $t1,$0,$t1   #t1(cuenta)= 0
      li $t2,1         #t2(indice)= 1
      li $t3,9         #t3(num elem)= 9
      li $t4,1         #t4 comprueba si es par
      la $t5,v         #t5 direccion del vector v
      li $t6,3         #t6(valor)= 3
      li $t7,1         #t7(valor)= 1

para: bgt $t2,$t3,finpara
      lw $s0,0($t5)  #s0 almacena los elementos de v
      and $s1,$s0,$t4
      beq $0,$s1,si  #v[i] es par
      ble $s0,$t6,sino #v[i] > 3

si: add $t0,$t0,$s0  #suma += v[i]

sino: add $t1,$t1,$t7  #cuenta += 1

finsi: addi $t2,$t2,1
       addi $t5,$t5,4
       j para

finpara: sw $t0,suma    #t0 guarda suma
         sw $t1,cuenta  #t1 guarda cuenta
         jr $31
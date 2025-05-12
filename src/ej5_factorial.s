.globl factorial
.data
 n: .word 8
 .text

 main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial
    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Imprimir Resultado
    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Imprimir newline
    addi a0, x0, 10
    ecall # Exit
 # factorial toma un argumento:
 # a0 contiene el número del cual queremos calcular el factorial
 # El valor de retorno debe almacenarse en a0
 factorial:
    mv t0, a0 #Movemos n a t0
    addi t4, t4, 1 #Inicializamos el factorial = 0
    beq t0, zero, finalizar #Caso base para el factorial de 0
    addi t1, t1, 1 #Iterador externo = 1
    loop:
    beq t1, t0, finalizar #Si iterator externo es igual a N, entonces terminamos
    addi t2, t1, 1 #Veces a multplicar el t4(t4 = factorial calculado de manera iterativa)
    addi t3, x0, 1 #Iterador del bucle interno = 1
    mv t5, t4 #Copiamos el valor que se va a sumar
    
    loop_mult:  #Bucle para multiplicar
    add t4, t4, t5  #Sumamos varias veces el mismo numero (multiplicar)
    addi t3, t3, 1  #Aumentamos el iterador en 1 (t3)
    blt t3, t2 loop_mult #Mientras t3(iterador) sea menor que t2 continuamos multiplicando
    addi t1, t1, 1 #Aumentamos el iterador del bucle externo
    j loop #Continuamos el bucle
    
    finalizar:
    mv a0, t4 #Pasamos el contenido de la operacion del factorial al registro de retorno a0
    jr ra  #retornamos
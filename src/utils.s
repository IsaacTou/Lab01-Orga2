.globl malloc, free, exit

.text
malloc: 
    mv a1 a0
    li a0 0x3CC
    addi a6 x0 1
    ecall
    jr ra
# Permite solicitar memoria dinámica. El tamaño en bytes debe pasarse en a0. El puntero al bloque
# asignado será devuelto en a0

free:
    mv a1 a0
    li a0 0x3CC
    addi a6 x0 4
    ecall
    jr ra
#Libera un bloque de memoria previamente reservado con malloc. La dirección a liberar debe
#pasarse en a0

exit:
    mv a1 a0
    li a0 17
    ecall
#Finaliza el programa con el código de salida dado en a0. Útil para reportar errores o resultados al
#entorno
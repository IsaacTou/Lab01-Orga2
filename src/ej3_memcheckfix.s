.import utils.s

.text
main:
    # Este programa llenarÃ¡ un arreglo de tamaÃ±o 10 con 0.

    # Asignar una matriz de tamaÃ±o 10
    li a0 40   # 10 ints, 4 bytes cada uno
    jal malloc # malloc esta definifo en utils.s
    mv t0 a0   # el apuntador se devuelve en a0

    # Llene la matriz con 0
    li t1 0  # t1 es el indice
    li t2 10 # t2 es el tamaÃ±o del arreglo

loop:
    # Almacenar 0 en el Ã­ndice actual
    sw x0 0(t0)
    # Incrementar el indice
    addi t1 t1 1
    # Incrementar el apuntador
    addi t0 t0 4
    # Comprueba si hemos terminado
    # Si no, ir a loop
    blt t1, t2 loop

    # Salir del programa
    jal free #Se libera la memoria asignada previamente
    li a0 0
    jal exit
.import utils.s

.text
main:
    # Este programa llenará un arreglo de tamaño 10 con 0.

    # Asignar una matriz de tamaño 10
    li a0 40   # 10 ints, 4 bytes cada uno
    jal malloc # malloc esta definifo en utils.s
    mv t0 a0   # el apuntador se devuelve en a0

    # Llene la matriz con 0
    li t1 0  # t1 es el indice
    li t2 10 # t2 es el tamaño del arreglo

loop:
    # Almacenar 0 en el índice actual
    sw x0 0(t0)
    # Incrementar el indice
    addi t1 t1 1
    # Incrementar el apuntador
    addi t0 t0 4
    # Comprueba si hemos terminado
    # Si no, ir a loop
    bge t2 t1 loop

    # Salir del programa
    li a0 0
    jal exit
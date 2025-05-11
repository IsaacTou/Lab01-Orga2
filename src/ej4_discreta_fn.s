.globl f

.text
f: # Funcion que se llamara desde un codigo Risc-V
mv t0, a0    #Movemos el -3 que se pasa por argumento a t0
mv t1, a1    #Movemos el puntero a la direccion del arreglo a t1
addi t0, t0, 3         #Hacemos (Numero a evaluar) + 3(Max del arreglo) = indice
slli t0, t0, 2         #indice x 4 2(elevado a la 2) sera igual al desplazamiento para acceder a dicho indice
add t1, t1, t0         #Sumamos el desplazamiento necesario a la direccion base del arreglo
lw a0, 0(t1)           #Cargamos el elemento requerido de ese indice del arreglo
jr ra                  #Terminamos la funcion
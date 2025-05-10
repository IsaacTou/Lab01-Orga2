.data
n: .word 12 

.text # Todo lo que este debajo de la directiva text es nuestro codigo
 
 main:
    add t0, x0, x0 #curr_fib = 0
    addi t1, x0, 1 # next_fib = 1
    la t3, n # cargar la direccion de la etiqueta n
    lw t3, 0(t3) # obtener el valor que se almacena en la direccion indicada por la etiqueta n
 
 fib:
    beq t3, x0, finalizar # salir del bucle una vez hayamos completado n iteraciones
    add t2, t1, t0 #new_fib = curr_fib + next_fib
    mv t0, t1 # curr_fib = next_fib
    mv t1, t2 # next_fib = new_fib
    addi t3, t3, -1 #decremento
    j fib # bucle
 
 finalizar:
    addi a0, x0, 1 # argumento a ecall para ejecutar imprimir entero
    addi a1, t0, 0 # argumento a ecall, el valor a imprimir
    ecall # llamada a ecall -> imprimir entero
    addi a0, x0, 10 # argumento a ecall para terminar el programa
    ecall # llamada para terminar el programa
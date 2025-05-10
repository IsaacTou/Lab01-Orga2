.text

addi a0 x0 1
addi a1 x0 2025

# Esta llamda imprime el entero almacenado en a1
ecall

# Esta parte del código, permite finalizar el programa.
addi a0 x0 17
addi a1 x0 0
ecall
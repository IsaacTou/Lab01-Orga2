.import ej4_discreta_fn.s

.data
# asciiz es una directiva que se usa para almacenar cadenas de caracteres
# asciiz anyade automaticamente un terminador nulo al final de la cadena
neg3:   .asciiz "f(-3) should be 6, and it is: "
neg2:   .asciiz "f(-2) should be 61, and it is: "
neg1:   .asciiz "f(-1) should be 17, and it is: "
zero:   .asciiz "f(0) should be -38, and it is: "
pos1:   .asciiz "f(1) should be 19, and it is: "
pos2:   .asciiz "f(2) should be 42, and it is: "
pos3:   .asciiz "f(3) should be 5, and it is: "

output: .word   6, 61, 17, -38, 19, 42, 5

.text
main:
    # evaluar f(-3), debe ser 6
    # cargar direccion de la cadena neg3 en a0
    la   a0, neg3
    # imprimir la cadena ubicada en neg3
    jal  print_str
    # cargar el argumento n = -3 en a0
    li   a0, -3
    # cargar en a1 el puntero al arreglo de valores output
    la   a1, output
    # llamar a la funcion f
    jal  f
    # imprimir el resultado de f(-3) en a0
    jal  print_int
    # imprimir nueva linea
    jal  print_newline

    # evaluar f(-2), debe ser 61
    la   a0, neg2
    jal  print_str
    li   a0, -2
    la   a1, output
    jal  f
    jal  print_int
    jal  print_newline

    # evaluar f(-1), debe ser 17
    la   a0, neg1
    jal  print_str
    li   a0, -1
    la   a1, output
    jal  f
    jal  print_int
    jal  print_newline

    # evaluar f(0), debe ser -38
    la   a0, zero
    jal  print_str
    li   a0, 0
    la   a1, output
    jal  f
    jal  print_int
    jal  print_newline

    # evaluar f(1), debe ser 19
    la   a0, pos1
    jal  print_str
    li   a0, 1
    la   a1, output
    jal  f
    jal  print_int
    jal  print_newline

    # evaluar f(2), debe ser 42
    la   a0, pos2
    jal  print_str
    li   a0, 2
    la   a1, output
    jal  f
    jal  print_int
    jal  print_newline

    # evaluar f(3), debe ser 5
    la   a0, pos3
    jal  print_str
    li   a0, 3
    la   a1, output
    jal  f
    jal  print_int
    jal  print_newline

    # pasar 10 al ecall para terminar el programa
    li   a0, 10
    ecall

# imprime un entero
# entrada: a0 = entero a imprimir
# no retorna nada
print_int:
    # mover valor de a0 a a1 para print_int
    mv   a1, a0
    # configurar a0=1 para llamar a print_int
    li   a0, 1
    ecall
    # retornar al llamador
    jr   ra

# imprime una cadena terminada en nulo
print_str:
    mv   a1, a0
    # configurar a0=4 para llamar a print_str
    li   a0, 4
    ecall
    jr   ra

# imprime un salto de linea
print_newline:
    # caracter nuevo linea en a1
    li   a1, '\n'
    # configurar a0=11 para llamar a print_char
    li   a0, 11
    ecall
    jr   ra

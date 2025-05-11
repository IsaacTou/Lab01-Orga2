    .data
 space: .asciiz " "        # separador en blanco
    .text
    .globl _start
 _start:
    # 1) Inicializar ASCII 'A'
    li   t0, 65           # t0 = 65 ('A')
 loop:
    # 2) Imprimir carácter
    li   a0, 11           # ecall print_char ①
    mv   a1, t0           # carácter a imprimir
    ecall                 # invoca print_char
    # 3) Imprimir espacio
    li   a0, 4            # ecall print_str
    la   a1, space
    ecall                 # invoca print_str
    # 4) Incrementar y comprobar fin de bucle
    addi t0, t0, 1        # siguiente código ASCII
    li   t1, 91           # 'Z' + 1 = 91
    blt  t0, t1, loop     # mientras t0 < 91, repetir bucle
    # 5) Salida limpia
    li   a0, 10           # ecall exit
    ecall                 # invoca exit
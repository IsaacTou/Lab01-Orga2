   .data
 space: .asciiz " "        # separador en blanco
   .text
   .globl _start
 _start:
   # 1) Inicializar valor 65
   li   t0, 65           # t0 = 65
 loop:
   # 2) Imprimir entero
   li   a0, 1            # ecall print_int ①
   mv   a1, t0           # entero a imprimir
   ecall                 # invoca print_int
   # 3) Imprimir espacio
   li   a0, 4            # ecall print_str
   la   a1, space
   ecall                 # invoca print_str
   # 4) Incrementar y comprobar fin de bucle
   addi t0, t0, 1        # siguiente valor
   li   t1, 91           # 90 + 1 = 91
   blt  t0, t1, loop     # mientras t0 < 91, repetir bucle
   # 5) Salida limpia
   li   a0, 10           # ecall exit
   ecall                 # invoca exit
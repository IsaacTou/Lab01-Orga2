#include <stdio.h>
int n = 12;

// Función para encontrar el n-ésimo número de Fibonacci
int main(void) {
 
int curr_fib = 0, next_fib = 1;
int new_fib;
    for (int i = n; i > 0; i--) {
        new_fib = curr_fib + next_fib;
        curr_fib = next_fib;
        next_fib = new_fib;
    }
printf("%d\n", curr_fib);
return 0;

}
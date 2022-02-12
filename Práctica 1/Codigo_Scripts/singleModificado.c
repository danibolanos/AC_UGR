#include <stdio.h>
#include <omp.h>

int main() {
   int n = 9, i, a, b[n];

   for (i=0; i<n; i++) b[i] = -1;
   #pragma omp parallel
   {
      #pragma omp single
      { printf("Introduce valor de inicialización a: ");
        scanf("%d", &a );
      }

      #pragma omp for
      for (i=0; i<n; i++)
         b[i] = a;

      #pragma omp single
      { printf("Resultados:\n");
       for (i=0; i<n; i++)
          printf("b[%d] = %d\t",i,b[i]);
       printf("\n");
       printf("Single ejecutada por el thread %d\n", omp_get_thread_num());
      }
   }
}

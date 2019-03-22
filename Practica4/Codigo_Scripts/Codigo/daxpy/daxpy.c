// daxpy.c

#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int main(int argc, char *argv[]){

   if(argc < 2){
      printf("Falta tamaño de vector\n");
      exit(1);
   }

   srand(time(NULL));

   unsigned int  n = atoi(argv[1]);
   int k = rand();

   double *x, *y;
   y = (double*) malloc(n*sizeof(double));
   x = (double*) malloc(n*sizeof(double));

   struct timespec cgt1,cgt2;

   for(int i=0; i<n; i++){
      x[i] = i+1;
      y[i] = i+3;
   }

   clock_gettime(CLOCK_REALTIME,&cgt1);

   for(int i=0; i<n; i++) y[i] += k*x[i]; //rutina denominada DAXPY 

   clock_gettime(CLOCK_REALTIME,&cgt2);

   double ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

   printf("Tiempo(seg.):%11.9f / / y[0]=%f, y[%i]=%f\n", ncgt, y[0], n-1, y[n-1]);

   free(x);
   free(y);

   return 0;
}

#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(int argc, char **argv)
{
  int i, n=200, chunk, a[n], suma=0;
  int modifier;
  omp_sched_t kind;
  
  if(argc < 3) {
    fprintf(stderr,"\nFalta iteraciones o chunk \n");
    exit(-1);
  }
  
  n = atoi(argv[1]);
  if (n>200)
    n=200;
  chunk = atoi(argv[2]);

  for (i=0; i<n; i++)
    a[i]=i;

  omp_set_dynamic(1); 
  omp_set_num_threads(4); 
  omp_set_schedule(2,3); //El 2 indica schedule_dynamic

  #pragma omp parallel 
  {
  #pragma omp single
  {
  printf("Dentro del parallel\n"); 
  printf("dyn-var: %d \n",omp_get_dynamic()); 
  printf("nthreads-var: %d \n",omp_get_max_threads()); 
  omp_get_schedule(&kind,&modifier); 
  printf("run-sched-var: Kind-> %d, Modifier-> %d \n",kind,modifier);
  }
  #pragma for firstprivate(suma)  \
  lastprivate(suma) schedule(dynamic,chunk)
  {
  for (i=0; i<n; i++) {
    suma = suma + a[i];
    printf(" thread %d suma a[%d]=%d suma=%d \n",
	   omp_get_thread_num(),i,a[i],suma);
  }
  }
  }

  printf("Fuera de 'parallel for' suma=%d\n",suma);
  printf("dyn-var: %d \n",omp_get_dynamic()); 
  printf("nthreads-var: %d \n",omp_get_max_threads()); 
  omp_get_schedule(&kind,&modifier); 
  printf("run-sched-var: Kind-> %d, Modifier-> %d \n",kind,modifier); 
}

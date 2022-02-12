/* pmtv-OpenMP.c
 Multiplicación de matriz por vector: v2 = T1*v1, T1 matriz triang. sup
 Para compilar usar (-lrt: real time library):
 gcc -O2 -fopenmp pmtv-OpenMPl.c -o pmtv-OpenMP -lrt

 Para ejecutar use: pmtv-OpenMP longitud
*/

 #include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
 #include <stdio.h> // biblioteca donde se encuentra la función printf()
 #include <time.h> // biblioteca donde se encuentra la función clock_gettime()
 #include <omp.h>

 //#define PRINTF_ALL // comentar para quitar el printf ...
		     // que imprime todos los componentes

 //Sólo puede estar definida uno de los dos constantes PMV_ (sólo uno de los ...
 //un defines siguientes puede estar descomentado):
 //#define PMV_GLOBAL // descomentar para que los vector/matriz sean variables ...
		       // globales (su longitud no estará limitada por el ...
		      // tamaño de la pila del programa)
 #define PMV_DYNAMIC // descomentar para que los vector/matriz sean variables ...
		      // dinámicas (memoria reutilizable durante la ejecución)
 #ifdef PMV_GLOBAL
 #define MAX 16350 // aprox 2^14
 double T1[MAX], v1[MAX], v2[MAX];
 #endif

 int main(int argc, char** argv){

    int i, k, s;
    double suma_fila;
    double cgt1, cgt2, ncgt; //para tiempo de ejecución

    int modifier;
    omp_sched_t kind;

    //Leer argumento de entrada (no de componentes del vector/matriz)
    if (argc<2){
       printf("Faltan no componentes del vector/matriz\n");
       exit(-1);
    }

    unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)

    #ifdef PMV_GLOBAL
    if (N>MAX) N=MAX;
    #endif
    #ifdef PMV_DYNAMIC
    double **T1, *v1, *v2;
    T1 = (double**) malloc(N*sizeof(double*));// malloc necesita el tamaño en bytes
    v1 = (double*) malloc(N*sizeof(double)); //si no hay espacio suficiente malloc devuelve NULL
    v2 = (double*) malloc(N*sizeof(double));
    if ( (T1==NULL) || (v1==NULL) || (v2==NULL) ){
       printf("Error en la reserva de espacio para los vectores/matriz\n");
       exit(-2);
    }
    for(i=0; i<N;i++){
       T1[i] = (double*) malloc((N-i)*sizeof(double));
       if ( T1[i]==NULL ){
          printf("Error en la reserva de espacio para la matriz\n");
          exit(-2);
       }
    }
    #endif

    //Inicializar Matriz Triangular Superior y vector
    #pragma omp parallel
    {
        #pragma omp for
          for(i=0; i<N; i++){
             v1[i] = N*0.1-i*0.1; //los valores dependen de N
             v2[i]=0;
          }

       #pragma omp for private(k)
          for(i=0; i<N; i++){
             for(k=0; k<N-i; k++)
                T1[i][k] = N*0.1-i*0.1-k*0.1; //los valores dependen de N
          }
    }

    cgt1 = omp_get_wtime();
    //Calcular producto Matriz Triangular*vector
    //Con runtime  el usuario pueda fijar la planificación de tareas usando la variable de entorno OMP_SCHEDULE
    #pragma omp parallel for private(suma_fila, k, s) schedule(runtime)
    for(i=0; i<N; i++){
       s = i;
       suma_fila = 0;
       for(k=0; k<N-i; k++){
         suma_fila += T1[i][k] * v1[s];
         s++;
       }
       v2[i] = suma_fila;
    }

    cgt2 = omp_get_wtime();
    ncgt= cgt2-cgt1;

    omp_get_schedule(&kind,&modifier); 
    printf("Número de threads usando: %d", omp_get_max_threads());
    printf("\nAsignación usada: %d", kind);
    printf("\nChunk usado: %d", modifier);

    //Imprimir resultado de la suma y el tiempo de ejecución
    #ifdef PRINTF_ALL
    printf("\nTiempo(seg.):%11.9f\t / Tamaño Matriz-Vector:%u\n",ncgt,N);
    for(i=0; i<N; i++)
       printf("V2[%d]=%8.6f\n", i, v2[i]);

    #else
       printf("\nTiempo(seg.):%11.9f\t / Tamaño Matriz-Vector:%u\t/ V2[0]=%8.6f / / V2[%d]=%8.6f /\n", ncgt,N, v2[0], N-1, v2[N-1]);
    #endif

    #ifdef PMV_DYNAMIC
    for(i=0; i<N;i++)
       free(T1[i]);
    free(T1); // libera el espacio reservado para T1
    free(v1); // libera el espacio reservado para v1
    free(v2); // libera el espacio reservado para v2
    #endif
    return 0;
}

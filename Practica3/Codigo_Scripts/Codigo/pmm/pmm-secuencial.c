/* pmm-secuencial.c
 Multiplicación de matriz por matriz (cuadradas): v2 = M1*M2
 Para compilar usar (-lrt: real time library):
 gcc -O2 -fopenmp pmm-secuencial.c -o pmm-secuencial -lrt

 Para ejecutar use: pmm-secuencial longitud
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
 double M1[MAX], M2[MAX], M3[MAX];
 #endif

 int main(int argc, char** argv){

    int i, j, k;

    double cgt1, cgt2, ncgt; //para tiempo de ejecución

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
    double **M1, **M2, **M3;
    M1 = (double**) malloc(N*sizeof(double*));// malloc necesita el tamaño en bytes
    M2 = (double**) malloc(N*sizeof(double*)); //si no hay espacio suficiente malloc devuelve NULL
    M3 = (double**) malloc(N*sizeof(double*));
    if ( (M1==NULL) || (M2==NULL) || (M3==NULL) ){
       printf("Error en la reserva de espacio para los vectores/matriz\n");
       exit(-2);
    }
    for(i=0; i<N;i++){
       M1[i] = (double*) malloc(N*sizeof(double));
       M2[i] = (double*) malloc(N*sizeof(double));
       M3[i] = (double*) malloc(N*sizeof(double));
       if ( (M1[i]==NULL) || (M2[i]==NULL) || (M3[i]==NULL)){
          printf("Error en la reserva de espacio para la matriz\n");
          exit(-2);
       }
    }
    #endif

    //Inicializar Matrices
    for(i=0; i<N; i++){
       for(k=0; k<N; k++){
          M1[i][k] = N*0.1-i*0.1-k*0.1; //los valores dependen de N
          M2[i][k] = N*0.1-i*0.1-k*0.1; //los valores dependen de N
          M3[i][k] = 0; //los valores dependen de N
       }
    }      

    cgt1 = omp_get_wtime();
    //Calcular producto de matrices
    for(i=0; i<N; i++){
       for(j=0; j<N; j++){
          for(k=0; k<N; k++){
            M3[i][j] += M1[i][k] * M2[k][j];
          }
       }
    }

    cgt2 = omp_get_wtime();
    ncgt= cgt2-cgt1;

    //Imprimir resultado de la suma y el tiempo de ejecución
    #ifdef PRINTF_ALL
    printf("Tiempo(seg.):%11.9f\t / Tamaño Matriz:%u\n",ncgt,N);
    for(i=0; i<N; i++)
       for(j=0; j<N; j++)
          printf("M3[%d][%d]=%8.6f\n", i, j, M3[i][j]);

    #else
       printf("Tiempo(seg.):%11.9f\t / Tamaño Matriz:%u\t/ M3[0][0]=%8.6f / / M3[%d][%d]=%8.6f /\n", ncgt,N, M3[0][0], N-1, N-1, M3[N-1][N-1]);
    #endif

    #ifdef PMV_DYNAMIC
    for(i=0; i<N;i++){
       free(M1[i]);
       free(M2[i]);
       free(M3[i]);
    }
    free(M1); // libera el espacio reservado para T1
    free(M2); // libera el espacio reservado para v1
    free(M3); // libera el espacio reservado para v2
    #endif
    return 0;
}

/* pmm-secuencial-modificado_b.c
 Multiplicación de matriz por matriz (cuadradas): M3 = M1*M2
 Para compilar usar (-lrt: real time library):
 gcc -O2 pmm-secuencial-modificado_b.c -o pmm-secuencial_b -lrt

 Para ejecutar use: pmm-secuencial_b longitud
*/

 #include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
 #include <stdio.h> // biblioteca donde se encuentra la función printf()
 #include <time.h> // biblioteca donde se encuentra la función clock_gettime()

 //#define PRINTF_ALL // comentar para quitar el printf ...
		     // que imprime todos los componentes

 //Sólo puede estar definida uno de los dos constantes PMV_ (sólo uno de los ...
 //un defines siguientes puede estar descomentado):
 #define PMV_GLOBAL // descomentar para que los vector/matriz sean variables ...
		       // globales (su longitud no estará limitada por el ...
		      // tamaño de la pila del programa)
 #ifdef PMV_GLOBAL
 #define MAX 8192 // 2^13
 double M1[MAX][MAX], M2[MAX][MAX], M3[MAX][MAX], M2T[MAX][MAX];
 #endif

 int main(int argc, char** argv){

    int i, j, k;

    struct timespec cgt1,cgt2;   //para tiempo de ejecución

    double aux;

    //Leer argumento de entrada (no de componentes del vector/matriz)
    if (argc<2){
       printf("Faltan no componentes del vector/matriz\n");
       exit(-1);
    }

    unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)

    #ifdef PMV_GLOBAL
    if (N>MAX) N=MAX;
    #endif

    //Inicializar Matrices
    for(i=0; i<N; i++){
       for(j=0; j<N; j++){
          M1[i][j] = N*0.1-i*0.1-j*0.1; //los valores dependen de N
          M2[i][j] = N*0.1-i*0.1-j*0.1; //los valores dependen de N
          M3[i][j] = 0; //los valores dependen de N
       }
    }         

    clock_gettime(CLOCK_REALTIME,&cgt1);

    //Calcular traspuesta de matriz

    /*Versión 1: Utilizando una matriz temporal
    for(i=0; i<N; i++){
       for(j=0; j<N; j++){
            M2T[i][j] = M2[j][i];
       }
    }*/

    /*Versión 2: Utilizando una variable temporal*/
    for(i=0; i<N; i++){
       for(j=i+1; j<N; j++){
            aux = M2[i][j];
	    M2[j][i] = M2[i][j];
	    M2[j][i] = aux;
       }
    }

    //Calcular producto de matrices

    // Intercambio del orden de los bucles j y k para aprovechar la localidad

    for(i=0; i<N; i++){
       for(k=0; k<N; k++){
          for(j=0; j<N; j++){
            M3[i][j] += M1[i][k] * M2[k][j]; //M2T si utilizamos la versión 1
          }
       }
    }

   clock_gettime(CLOCK_REALTIME,&cgt2);
   double ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    //Imprimir resultado de la suma y el tiempo de ejecución
    #ifdef PRINTF_ALL
    printf("Tiempo(seg.):%11.9f\t / Tamaño Matriz:%u\n",ncgt,N);
    for(i=0; i<N; i++){
       for(j=0; j<N; j++)
          printf("%8.6f ", i, j, M3[i][j]);
    printf("\n");
    }
    #else
       printf("Tiempo(seg.):%11.9f\t / Tamaño Matriz:%u\t/ M3[0][0]=%8.6f / / M3[%d][%d]=%8.6f /\n", ncgt,N, M3[0][0], N-1, N-1, M3[N-1][N-1]);
    #endif

    return 0;
}

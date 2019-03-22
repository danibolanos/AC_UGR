/* pmm-secuencial-modificado_a.c
 Multiplicación de matriz por matriz (cuadradas): M3 = M1*M2
 Para compilar usar (-lrt: real time library):
 gcc -O2 pmm-secuencial-modificado_a.c -o pmm-secuencial_a -lrt

 Para ejecutar use: pmm-secuencial_a longitud
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
 double M1[MAX][MAX], M2[MAX][MAX], M3[MAX][MAX];
 #endif

 int main(int argc, char** argv){

    int i, j, k;
    double s0=0, s1=0, s2=0, s3=0, s4=0, s5=0, s6=0, s7=0;
    struct timespec cgt1,cgt2;   //para tiempo de ejecución

    //Leer argumento de entrada (no de componentes del vector/matriz)
    if (argc<2){
       printf("Faltan no componentes del vector/matriz\n");
       exit(-1);
    }
    if (atoi(argv[1]) % 8 != 0){
       printf("La matriz no es múltiplo del desenrollado de los bucles. Pruebe con un múltiplo de 8.\n");
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
    //Calcular producto de matrices

    /*Versión 1: Desenrollado del bucle j*/
    for(i=0; i<N; i++){
       s0=s1=s2=s3=s4=s5=s6=s7=0;
       for(j=0; j<N; j+=8){
          for (k=0; k < N; k++){
             M3[i][j] += M1[i][k]*M2[k][j];
             M3[i][j+1] += M1[i][k]*M2[k][j+1];
             M3[i][j+2] += M1[i][k]*M2[k][j+2];
             M3[i][j+3] += M1[i][k]*M2[k][j+3];
             M3[i][j+4] += M1[i][k]*M2[k][j+4];
             M3[i][j+5] += M1[i][k]*M2[k][j+5];
             M3[i][j+6] += M1[i][k]*M2[k][j+6];
             M3[i][j+7] += M1[i][k]*M2[k][j+7];

          }
       }
    }

    /*Versión 2: Desenrollado del bucle k
    for(i=0; i<N; i++){
       for(j=0; j<N; j++){
          s0=s1=s2=s3=s4=s5=s6=s7=0;
          for (k=0; k < N; k+=8){
             s0 += M1[i][k]*M2[k][j];
             s1 += M1[i][k+1]*M2[k+1][j];
             s2 += M1[i][k+2]*M2[k+2][j];
             s3 += M1[i][k+3]*M2[k+3][j];
             s4 += M1[i][k+4]*M2[k+4][j];
             s5 += M1[i][k+5]*M2[k+5][j];
             s6 += M1[i][k+6]*M2[k+6][j];
             s7 += M1[i][k+7]*M2[k+7][j];

          }
          M3[i][j] = s0 + s1 + s2 + s3 + s4 + s5 + s6 + s7;
       }
    }*/

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

#!/bin/bash

echo "TAMANIO 200"

echo "Programa secuencial"
./pmm-secuencial 200

echo "Programa paralelo 1 threads"
export OMP_NUM_THREADS=1

./pmm-OpenMP 200

echo "Programa paralelo 2 threads"
export OMP_NUM_THREADS=2

./pmm-OpenMP 200

echo "Programa paralelo 3 threads"
export OMP_NUM_THREADS=3

./pmm-OpenMP 200

echo "Programa paralelo 4 threads"
export OMP_NUM_THREADS=4

./pmm-OpenMP 200

echo "TAMANIO 1200"

echo "Programa secuencial"
./pmm-secuencial 1200

echo "Programa paralelo 1 threads"
export OMP_NUM_THREADS=1

./pmm-OpenMP 1200

echo "Programa paralelo 2 threads"
export OMP_NUM_THREADS=2

./pmm-OpenMP 1200

echo "Programa paralelo 3 threads"
export OMP_NUM_THREADS=3

./pmm-OpenMP 1200

echo "Programa paralelo 4 threads"
export OMP_NUM_THREADS=4

./pmm-OpenMP 1200

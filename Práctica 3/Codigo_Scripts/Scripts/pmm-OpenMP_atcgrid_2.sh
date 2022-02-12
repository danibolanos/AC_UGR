#!/bin/bash
#Se asigna al trabajo el nombre pmm-OpenMP
#PBS -N pmm-OpenMP
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:"
cat $PBS_NODEFILE
#Se ejecuta pmm-OpenMP

$PBS_O_WORKDIR/pmm-secuencial 1200

export OMP_NUM_THREADS=1

$PBS_O_WORKDIR/pmm-OpenMP 1200

export OMP_NUM_THREADS=2

$PBS_O_WORKDIR/pmm-OpenMP 1200

export OMP_NUM_THREADS=3

$PBS_O_WORKDIR/pmm-OpenMP 1200

export OMP_NUM_THREADS=4

$PBS_O_WORKDIR/pmm-OpenMP 1200

export OMP_NUM_THREADS=5

$PBS_O_WORKDIR/pmm-OpenMP 1200

export OMP_NUM_THREADS=6

$PBS_O_WORKDIR/pmm-OpenMP 1200

export OMP_NUM_THREADS=7

$PBS_O_WORKDIR/pmm-OpenMP 1200

export OMP_NUM_THREADS=8

$PBS_O_WORKDIR/pmm-OpenMP 1200

export OMP_NUM_THREADS=9

$PBS_O_WORKDIR/pmm-OpenMP 1200

export OMP_NUM_THREADS=10

$PBS_O_WORKDIR/pmm-OpenMP 1200

export OMP_NUM_THREADS=11

$PBS_O_WORKDIR/pmm-OpenMP 1200

export OMP_NUM_THREADS=12

$PBS_O_WORKDIR/pmm-OpenMP 1200

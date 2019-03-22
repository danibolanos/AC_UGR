#!/bin/csh

@ inicio = (512)
@ fin = (262144)

@ i = $inicio
echo > salida_daxpy.dat
while($i <= $fin)
echo Ejecución tam = $i
echo `./daxpyO3 $i` >> salida_daxpy.dat
@ i *= 2
end

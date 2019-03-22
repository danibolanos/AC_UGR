#!/bin/csh

@ inicio = 16384
@ fin = 67108864

@ i = $inicio
echo > salida_SumaVectoresSECTIONS.dat
while($i <= $fin)
echo Ejecución tam = $i
echo `./SumaVectoresSECTIONS $i` >> salida_SumaVectoresSECTIONS.dat
@ i *= 2
end

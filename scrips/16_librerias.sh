#!/bin/bash
#Nota: Este script depende de que tengas el código de 15_funciones.sh 
#guardado también como 'libreria.sh' en esta misma carpeta.
source libreria.sh
muestrapantalla 69 123 "epa"
sumame 1337 3389 && echo "OK" || echo "Ocurrió un error"
echo "Resultado: ${RESULTADO} $!"

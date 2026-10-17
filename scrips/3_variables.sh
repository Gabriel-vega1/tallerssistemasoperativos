#!/bin/sh
#Muestra el uso de variables
#No existen los tipos
#definición de variables
una_variable=666
MINOMBRE="Richard"
NOMBRES="Iñigo Asier Sten Roberto Pello"
BOOLEANO=true
echo "Echemos un ojo a las variables "
echo "Un número: ${una_variable}"
echo "Un nombre ${MINOMBRE}"
echo "Un grupo de nombres: ${NOMBRES}"

#Al script se le pueden pasar argumentos. Para recogerlos
# hay que usar ${número}
echo "Has invocado el script pasándome ${0} y ${1}"

#Otras variables especiales
echo "Me has pasado $# argumentos"
echo IDa: ${!} y $@
echo "Mi directorio actual: ${PWD} y mi usuario ${UID}"

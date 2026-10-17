#!/bin/bash
# Muestra el uso de variables
#Sacar parte del valor de una variable (substring)
NOMBRE="Navarrux Live edition"
echo ${NOMBRE} una parte ${NOMBRE:8} y otra ${NOMBRE:8:4}

#Valores por defecto.
SINVALOR=
echo "Variable SINVALOR: ${SINVALOR:-31337} y ${VACIO:-'Miguel Indurain'}"
echo "La variable SINVALOR no tiene valor algun ${SINVALOR}"

echo "Variable SINVALOR: ${SINVALOR:=31337} y ${VACIO:='Miguel Indurain'}"
echo "La variable SINVALOR no tiene valor algun ${SINVALOR}"

PROGRAMA='sniffit'
echo "valor de PROGRAMA: ${PROGRAMA:+'tcpdump'} y ahora ${PROGRAMA}"

echo "Valor de: ${EJEMPLO:?'Roberto'} y luego ${EJEMPLO}"

for i in ${!P*}; do echo $i; done

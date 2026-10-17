#!/bin/bash
funcion () {
    echo "Se ha recibido una señal: ${FUNCNAME} ${0}"
}

trap "funcion" INT QUIT TSTP

while true
do
    sleep 2
    echo "ufff qué sueño..."
done

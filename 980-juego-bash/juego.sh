#!/usr/bin/env bash
set -u
number=$(( RANDOM % 100 + 1 ))
attempts=0
echo 'Adivina el número entre 1 y 100. Escribe q para salir.'
while true; do
  read -r -p 'Tu intento: ' guess || exit 0
  [[ "$guess" == q || "$guess" == Q ]] && { echo "La respuesta era $number."; exit 0; }
  if [[ ! "$guess" =~ ^[0-9]+$ ]] || (( guess < 1 || guess > 100 )); then
    echo 'Escribe un número entero entre 1 y 100.'; continue
  fi
  ((attempts+=1))
  if (( guess < number )); then echo 'Más alto.'
  elif (( guess > number )); then echo 'Más bajo.'
  else printf '¡Correcto! Lo lograste en %d intentos.\n' "$attempts"; break
  fi
done

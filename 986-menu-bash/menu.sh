#!/bin/bash
# Tarea 986: menú en Bash que ejecuta los 18 scripts de la tarea 992
# Archivo único: los 18 scripts están incluidos como funciones (cada uno corre en su propio subshell)

script_01 () (
# ----- 01_hola_mundo -----
# Esto es un comentario
echo "Hola mundo"
)

script_02 () (
# ----- 02_hola_variable -----
# En la primera linea se establece con que shell se ejecuta
SALUDO="Hola mundo"
echo -n "Este script te dice: "
echo ${SALUDO}
)

script_03 () (
# ----- 03_variables -----
# Muestra el uso de variables (no existen los tipos)
una_variable=666
MI_NOMBRE="Richard"
NOMBRES="Iñigo Asier Sten Roberto Pello"
BOOLEANO=true
echo "Echemos un ojo a las variables"
echo "Un número: ${una_variable}"
echo "Un nombre: ${MI_NOMBRE}"
echo "Un grupo de nombres: ${NOMBRES}"
echo "Un booleano: ${BOOLEANO}"
# ${0} nombre del script, ${1} primer argumento, ${2} segundo...
echo "Has invocado el script ${0} con el argumento: ${1}"
# $# : número de argumentos
echo "Me has pasado $# argumentos"
# $@ : grupo de parámetros, $$ : PID del proceso
echo "PID: $$ y parámetros: $@"
# Variables de entorno
echo "Mi directorio actual: ${PWD} y mi usuario ${UID}"
)

script_04 () (
# ----- 04_arrays -----
# Muestra el uso de arrays de una dimensión
asociaciones[0]="Gruslin"
asociaciones[1]="Hackresi"
asociaciones[2]="NavarradotNET"
asociaciones[3]="Riberlug"
# Otra forma de definirlos
partidos=("UPN" "PSN" "CDN" "IUN" "Nafarroa BAI" "RCN")
numeros=(15 23 45 42 23 1337 23 666 69)
echo "${asociaciones[0]} es una asociación, ${partidos[1]} un partido"
echo "Tamaño de asociaciones: ${#asociaciones[@]}"
echo "Tamaño de partidos: ${#partidos[@]}"
echo "Todos los números: ${numeros[@]}"
)

script_05 () (
# ----- 05_otros_usos_variables -----
# Substring
NOMBRE="Navarrux Live edition"
echo "${NOMBRE} | una parte: ${NOMBRE:8} | y otra: ${NOMBRE:8:4}"

# ${variable:-valorpordefecto}
SINVALOR=
echo "Variable SINVALOR: ${SINVALOR:-31337} eta ${VACIO:-'Miguel Indurain'}"
echo "SINVALOR sigue sin valor: [${SINVALOR}]"

# ${variable:=valorpordefecto} (el valor queda establecido)
echo "Variable SINVALOR: ${SINVALOR:=31337} eta ${VACIO:='Miguel Indurain'}"
echo "Ahora SINVALOR vale: [${SINVALOR}]"

# ${variable:+valor}: si la variable SÍ tiene valor, se usa otro
PROGRAMA='sniffit'
echo "valor de PROGRAMA: ${PROGRAMA:+'tcpdump'} y ahora ${PROGRAMA}"

# ${variable:?mensaje}: error si no está definida (en subshell para no cortar el script)
( echo "Valor de: ${EJEMPLO:?'EJEMPLO no definida'}" ) 2>&1 || echo "(error capturado)"

# ${!prefijo*}: lista de variables que empiezan por un prefijo
echo "Variables que empiezan por P:"
for i in ${!P*}; do echo $i; done
)

script_06 () (
# ----- 06_aritmeticas -----
# Operadores: -, +, *, /, %, **, variable++, variable--
VALOR1=23
VALOR2=45
# Con expr
RESULTADO=`expr ${VALOR1} + ${VALOR2}`
echo "Resultado: ${RESULTADO}"
RESULTADO=`expr ${VALOR1} + ${VALOR2} + 3`
echo "Resultado: ${RESULTADO}"

VALOR1=5
VALOR2=4
echo "${VALOR1} y ${VALOR2}"
# Con $(( ))
RESULTADO=$(( ${VALOR1} + ${VALOR2} + 2 ))
echo "Ahora: ${VALOR1} + ${VALOR2} + 2 = ${RESULTADO}"
RESULTADO=$(( ${VALOR1} + $(( ${VALOR2} * 3 )) ))
echo "Ahora: ${VALOR1} + ${VALOR2} * 3 = ${RESULTADO}"
echo "Resta: $(( VALOR1 - VALOR2 )) | División: $(( VALOR1 / VALOR2 )) | Módulo: $(( VALOR1 % VALOR2 )) | Potencia: $(( VALOR1 ** VALOR2 ))"
VALOR1=$(( VALOR1 + 1 ))
echo "Incremento: ${VALOR1}"
)

script_07 () (
# ----- 07_logicas -----
# && : and   || : or   ! : not
booleano=true
# Si booleano es true se muestra "OK"
$booleano && echo "OK" || echo "no es true"

# Negación
! $booleano || echo "Ahora no es falso (booleano sigue siendo true)"
! false && echo "not false = true"

# Comparaciones numéricas: -eq -ne -lt -le -gt -ge
valor=6
test $valor -le 6 && echo "Se cumple (6 <= 6)"
test $valor -gt 10 || echo "6 no es mayor que 10"

# Asignaciones
nuevo=${valor}
test ${nuevo} -eq ${valor} && echo "Son lo mismo"
echo "Ahora ${nuevo} es lo mismo que ${valor}"
)

script_08 () (
# ----- 08_condicionales -----
VARIABLE=45
if [ ${VARIABLE} -gt 0 ]; then
  echo "${VARIABLE} es mayor que 0"
fi

# El then en la siguiente línea
if [ -e /etc/passwd ]
then
  echo "OK, existe /etc/passwd"
fi

## if-else
OTRA=-23
if [ ${OTRA} -lt 0 ]
then
  echo "${OTRA} es menor que 0"
else
  echo "${OTRA} es mayor que 0"
fi

## if-elif-else (con read para pedir datos)
echo -n "Mete un valor: "
read VALOR1
echo -n "Mete otro valor: "
read VALOR2
echo "Has introducido los valores ${VALOR1} y ${VALOR2}"
if [ ${VALOR1} -gt ${VALOR2} ]
then
  echo "${VALOR1} es mayor que ${VALOR2}"
elif [ ${VALOR1} -lt ${VALOR2} ]
then
  echo "${VALOR1} es menor que ${VALOR2}"
else
  echo "${VALOR1} y ${VALOR2} son iguales"
fi

## test: crea un fichero si no existe
test -f './fichero.txt' || touch fichero.txt && echo "fichero.txt listo"
)

script_09 () (
# ----- 09_comprobar_fichero -----
# Comprueba si un fichero existe. Uso: ./09_comprobar_fichero.sh fichero
FICHERO="${1:-/etc/passwd}"
echo "Comprobando: ${FICHERO}"
if [ -e "${FICHERO}" ] && [ -f "${FICHERO}" ]
then
  echo "OK, el fichero existe"
else
  echo "NO existe"
fi

# Negación con !
if [ ! -e "${FICHERO}" ]
then
  echo "No existe (negación)"
fi

# Otras comprobaciones
[ -d "${FICHERO}" ] && echo "Es un directorio"
[ -r "${FICHERO}" ] && echo "Tiene permiso de lectura"
[ -w "${FICHERO}" ] && echo "Tiene permiso de escritura"
[ -x "${FICHERO}" ] && echo "Tiene permiso de ejecución"
[ -s "${FICHERO}" ] && echo "Es mayor que 0 bytes"
)

script_10 () (
# ----- 10_case -----
NOMBRE=""
echo -n "Dame un nombre (iñigo, sten, asier, pello): "
read NOMBRE
case ${NOMBRE} in
  iñigo)
    echo "${NOMBRE} dice: me dedico a Navarrux"
    ;;
  sten)
    echo "${NOMBRE} dice: tengo un blog friki"
    ;;
  asier)
    echo "${NOMBRE} dice: .NET me gusta"
    ;;
  pello)
    echo "${NOMBRE} dice: el shell mola"
    ;;
  *)
    echo "A ${NOMBRE} no lo conozco"
esac
)

script_11 () (
# ----- 11_for -----
## for simple
echo "FOR simple:"
for i in a b c d e f g h i
do
  echo "letra: $i"
done

## for para recorrer una lista
NOMBRES="Iñigo Sten Asier Pello Roberto"
echo "FOR para recorrer una lista:"
for i in ${NOMBRES}
do
  echo ${i}
done

## for con el resultado de un comando
echo "FOR con el resultado de un comando:"
for i in `ls`
do
  echo ${i}
done

## for con un grupo de ficheros
echo "FOR con ficheros:"
for i in *.sh
do
  ls -lh ${i}
done

## for clásico con un índice
echo "FOR clásico:"
for (( cont=0 ; cont < 10 ; cont=`expr $cont + 1` ))
do
  echo "Ahora valgo> ${cont}"
done
)

script_12 () (
# ----- 12_while -----
echo "WHILE en marcha"
cont=0
# Termina cuando $cont llega a 100
while (test ${cont} -lt 100)
do
  cont=`expr $cont + 10`
  echo "Valor del contador: ${cont}"
done
echo "Valor final del contador: ${cont}"
# Un while infinito sería: while true; do comando; done
)

script_13 () (
# ----- 13_until -----
# until se ejecuta hasta que la condición sea verdadera
echo "Estructura until"
cont=15
until (test ${cont} -le 0)
do
  cont=`expr $cont - 1`
  echo "Valor del contador: ${cont}"
done
echo "Valor final del contador: ${cont}"
)

script_14 () (
# ----- 14_select -----
# select sirve para crear menús de selección
echo "Select de distros"
DISTROS="Debian Ubuntu Navarrux Gentoo Mandriva"
PS3="Selecciona la mejor opción por favor: "
select resultado in ${DISTROS}
do
  # Si la longitud de resultado es > 0 ya se seleccionó algo válido
  (test ${#resultado} -ne 0) && break
  echo "Opción no válida, intenta de nuevo"
done
echo "Sistema seleccionado: [${resultado}] longitud de cadena: ${#resultado}"
)

script_15 () (
# ----- 15_funciones -----
# Las funciones se definen antes de usarlas
RESULTADO=0

muestrapantalla () {
  echo "Valores: $0> $1 y $2 y $3"
}

# return solo puede devolver números
sumame () {
  echo "Estamos en la función: ${FUNCNAME}"
  echo "Parametros: $1 y $2"
  RESULTADO=`expr ${1} + ${2}`
  return 0
}

# Es posible la función recursiva (no se ejecuta aquí)
boom () {
  echo "No ejecutes esto... "
  boom
}

# La llamada se hace sin paréntesis
muestrapantalla 3 4 "epa"
sumame 45 67 && echo "OK" || echo "Ocurrió un error"
echo "Resultado: ${RESULTADO}"
)

script_16 () (
# ----- 16_librerias -----
# Funciones reutilizables (se importan con source)
RESULTADO=0

muestrapantalla () {
  echo "Valores: $0> $1 y $2 y $3"
}

# return solo devuelve números
sumame () {
  echo "Estamos en la función: ${FUNCNAME}"
  echo "Parametros: $1 y $2"
  RESULTADO=`expr ${1} + ${2}`
  return 0
}

# Función recursiva (NO se llama, se quedaría en bucle)
boom () {
  echo "No ejecutes esto... "
  boom
}
# No existen librerías, pero se simulan con source

muestrapantalla 69 123 "epa"
sumame 1337 3389 && echo "OK" || echo "Ocurrió un error"
echo "Resultado: ${RESULTADO}"
)

script_17 () (
# ----- 17_senales -----
funcion () {
  echo "Se ha recibido una señal (script: ${0})"
}
# trap captura señales: Ctrl-C (INT), QUIT y Ctrl-Z (TSTP)
trap "funcion" INT QUIT TSTP

echo "Prueba pulsar Ctrl-C durante el bucle (5 vueltas)"
cont=0
while [ ${cont} -lt 5 ]
do
  sleep 2
  echo "ufff qué sueño... (${cont})"
  cont=`expr $cont + 1`
done
)

script_18 () (
# ----- 18_colores -----
# Colores ANSI con echo -e. \033 es el carácter escape
echo -e "\033[40m\033[37m Blanco \033[0m"
echo -e "\033[40m\033[1;37m Gris claro \033[0m"
echo -e "\033[40m\033[30m Negro \033[0m (esto es negro)"
echo -e "\033[40m\033[1;30m Gris \033[0m"
echo -e "\033[40m\033[31m Rojo \033[0m"
echo -e "\033[40m\033[1;31m Rojo claro \033[0m"
echo -e "\033[40m\033[32m Verde \033[0m"
echo -e "\033[40m\033[1;32m Verde claro \033[0m"
echo -e "\033[40m\033[33m Marrón \033[0m"
echo -e "\033[40m\033[1;33m Amarillo \033[0m"
echo -e "\033[40m\033[34m Azul \033[0m"
echo -e "\033[40m\033[1;34m Azul claro \033[0m"
echo -e "\033[40m\033[35m Púrpura \033[0m"
echo -e "\033[40m\033[1;35m Rosa \033[0m"
echo -e "\033[40m\033[36m Cyan \033[0m"
echo -e "\033[40m\033[1;36m Cyan claro \033[0m"
# Fondos de otro color
echo -e "\033[42m\033[31m Navarrux v1.0 \033[0m"
echo -e "\033[40m\033[4;33m Amarillo subrayado \033[0m"
)

NOMBRES=(
  "Hola mundo"
  "Hola mundo con variable"
  "Variables"
  "Arrays"
  "Otros usos de variables"
  "Operaciones aritméticas"
  "Operaciones lógicas"
  "Condicionales (if)"
  "Comprobar si un fichero existe"
  "Estructura case"
  "Iteración for"
  "Iteración while"
  "Iteración until"
  "Iteración select"
  "Funciones"
  "Librerías (source)"
  "Señales (trap)"
  "Colores ANSI"
)

mostrar_menu () {
  clear
  echo -e "\033[1;36m=====================================\033[0m"
  echo -e "\033[1;33m   MENÚ DE SCRIPTS BASH (Tarea 986)  \033[0m"
  echo -e "\033[1;36m=====================================\033[0m"
  for i in "${!NOMBRES[@]}"; do
    printf "  %2d) %s\n" $((i+1)) "${NOMBRES[$i]}"
  done
  echo "   0) Salir"
  echo -e "\033[1;36m=====================================\033[0m"
}

while true
do
  mostrar_menu
  read -p "Elige una opción: " OPCION
  if [[ "${OPCION}" == "0" ]]; then
    echo "Adiós"
    break
  elif [[ "${OPCION}" =~ ^[0-9]+$ ]] && [ "${OPCION}" -ge 1 ] && [ "${OPCION}" -le 18 ]; then
    echo -e "\n\033[1;32m>>> Ejecutando script ${OPCION}: ${NOMBRES[$((OPCION-1))]}\033[0m\n"
    script_$(printf "%02d" ${OPCION})
    echo -e "\n\033[1;32m<<< Fin del script\033[0m"
    read -p "Presiona Enter para volver al menú..." _
  else
    echo "Opción no válida"
    sleep 1
  fi
done
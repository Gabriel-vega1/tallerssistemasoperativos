# Menú Bash para los 18 scripts (Tarea 992)

El `menu.sh` de la raíz del repositorio muestra y ejecuta los 18 archivos originales de `scrips/`. Inicia con `bash menu.sh` desde Linux, macOS o WSL. En esta carpeta también está `menu.sh`, la versión autónoma del texto que compartiste, con los 18 ejercicios definidos como funciones en subshells.

El contenido incluye variables, arrays, expansión de parámetros, aritmética,
condiciones, pruebas de archivos, `case`, ciclos, `select`, funciones,
`source`, señales y colores ANSI.

## Uso

```bash
bash menu.sh
```

La opción 0 termina el menú. Algunas opciones piden datos; `select` y la
captura de señales se exploran de forma interactiva. La opción de condicionales
crea `fichero.txt` en el directorio desde el que se inicia el menú si aún no
existe. Evita ejecutarla dentro de una carpeta donde no quieras ese archivo.

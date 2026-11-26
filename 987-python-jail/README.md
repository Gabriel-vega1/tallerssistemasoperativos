# Tiny Python Jail — reto CTF

**Dificultad:** fácil · **Categoría:** Python Jail · **Puntos sugeridos:** 100

## Reto

El intérprete acepta una expresión Python de hasta 500 caracteres y afirma
haber desactivado los builtins. Recupera la bandera que está en `/flag`.

## Ejecución aislada

Requiere Docker Compose. Ejecuta `docker compose run --rm python-jail` desde
esta carpeta. La imagen no tiene red, usa un usuario sin privilegios y limita
memoria, CPU y procesos. No montes carpetas del host.

## Archivos

- `challenge.py`: servicio vulnerable intencionalmente.
- `Dockerfile` y `compose.yaml`: configuración aislada.
- `SOLUTION.md`: solución para organizadores; no compartir con participantes.

Este reto usa `eval` deliberadamente para enseñar que quitar `__builtins__` no
crea un sandbox seguro. No uses este código para ejecutar entradas reales de
usuarios.

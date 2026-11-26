# Analizador de archivos Bash

Uso: `bash analizar_archivo.sh RUTA`. Muestra tipo, tamaño, permisos,
propietario, fecha de modificación, número de líneas/palabras/caracteres
(cuando es texto) y hash SHA-256 cuando `sha256sum` está disponible.
Compatible con Linux y WSL; para macOS, instala GNU coreutils para el hash.

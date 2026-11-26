#!/usr/bin/env bash
set -u
if [[ $# -ne 1 ]]; then echo "Uso: $0 RUTA" >&2; exit 2; fi
file=$1
if [[ ! -e "$file" ]]; then echo "Error: no existe: $file" >&2; exit 1; fi
printf 'Ruta: %s\n' "$(realpath -- "$file" 2>/dev/null || printf '%s' "$file")"
if [[ -d "$file" ]]; then kind="Directorio"; elif [[ -L "$file" ]]; then kind="Enlace simbólico"; elif [[ -f "$file" ]]; then kind="Archivo regular"; else kind="Otro tipo"; fi
printf 'Tipo: %s\n' "$kind"
if [[ -f "$file" ]]; then
  if command -v stat >/dev/null 2>&1; then
    stat -c 'Tamaño: %s bytes%nPermisos: %A (%a)%nPropietario: %U:%G%nModificado: %y' -- "$file" 2>/dev/null || stat -f 'Tamaño: %z bytes%nPermisos: %Sp%nPropietario: %Su:%Sg%nModificado: %Sm' -- "$file"
  fi
  if [[ -r "$file" ]] && file --brief --mime "$file" 2>/dev/null | grep -q '^text/'; then
    printf 'Líneas: '; wc -l < "$file"
    printf 'Palabras: '; wc -w < "$file"
    printf 'Bytes: '; wc -c < "$file"
  else printf 'Contenido: no parece ser texto o no se puede leer.\n'; fi
  if command -v sha256sum >/dev/null 2>&1; then sha256sum -- "$file"; elif command -v shasum >/dev/null 2>&1; then shasum -a 256 -- "$file"; fi
fi

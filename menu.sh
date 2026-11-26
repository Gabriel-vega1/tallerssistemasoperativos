#!/usr/bin/env bash
set -u
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$ROOT/scrips"

if [[ ! -d "$SCRIPTS_DIR" ]]; then
  echo "No se encontró la carpeta esperada: $SCRIPTS_DIR" >&2
  exit 1
fi

mapfile -t scripts < <(find "$SCRIPTS_DIR" -maxdepth 1 -type f -name '*.sh' -print | sort -V)
if (( ${#scripts[@]} != 18 )); then
  printf 'Se esperaban 18 scripts en %s; se encontraron %d.\n' "$SCRIPTS_DIR" "${#scripts[@]}" >&2
  exit 1
fi

while true; do
  if [[ -t 1 ]] && command -v clear >/dev/null 2>&1; then clear; fi
  printf '\033[1;36m=====================================\033[0m\n'
  printf '\033[1;33m        MENÚ DE SCRIPTS BASH         \033[0m\n'
  printf '\033[1;36m=====================================\033[0m\n'
  for i in "${!scripts[@]}"; do
    filename=$(basename -- "${scripts[$i]}" .sh)
    label="${filename#*_}"
    label="${label//_/ }"
    printf ' %2d) %s\n' "$((i + 1))" "$label"
  done
  printf '  0) Salir\n'
  printf '\033[1;36m=====================================\033[0m\n'
  read -r -p 'Elige una opción: ' option || exit 0

  if [[ "$option" == 0 ]]; then
    echo 'Adiós'
    break
  elif [[ "$option" =~ ^[0-9]+$ ]] && (( option >= 1 && option <= ${#scripts[@]} )); then
    script="${scripts[$((option - 1))]}"
    printf '\n>>> Ejecutando %s\n\n' "$(basename -- "$script")"
    bash "$script"
    printf '\n<<< Fin del script\n'
    read -r -p 'Presiona Enter para volver al menú...' _ || exit 0
  else
    echo 'Opción no válida.'
    sleep 1
  fi
done

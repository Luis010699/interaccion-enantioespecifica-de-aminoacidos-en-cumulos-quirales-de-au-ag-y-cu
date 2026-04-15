#!/usr/bin/env bash
set -euo pipefail

# prepare_case.sh
# Uso:
#   bash scripts/prepare_case.sh <case_dir>
#
# Objetivo:
#   Preparar un directorio de caso para cálculo.
#
# TODO reales sugeridos:
#   - copiar plantillas base si faltan archivos;
#   - validar geometry.in y control.in;
#   - inyectar parámetros desde variables de entorno o argumentos;
#   - generar nombres de corrida y metadatos del caso.

CASE_DIR="${1:-}"

if [[ -z "${CASE_DIR}" || ! -d "${CASE_DIR}" ]]; then
  echo "ERROR: Debes pasar un directorio de caso existente." >&2
  exit 1
fi

echo "[prepare] Caso: ${CASE_DIR}"

# Validaciones mínimas
if [[ ! -f "${CASE_DIR}/geometry.in" ]]; then
  echo "WARN: No existe geometry.in en ${CASE_DIR} (placeholder)."
fi

if [[ ! -f "${CASE_DIR}/control.in" ]]; then
  echo "WARN: No existe control.in en ${CASE_DIR} (placeholder)."
fi

# Ejemplo de marcador de preparación
mkdir -p "${CASE_DIR}/prep"
printf "prepared_at=%s\n" "$(date -Iseconds)" > "${CASE_DIR}/prep/metadata.txt"

echo "[prepare] OK (placeholder)."

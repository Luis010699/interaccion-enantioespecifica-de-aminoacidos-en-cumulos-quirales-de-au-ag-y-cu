#!/usr/bin/env bash
set -euo pipefail

# postprocess.sh
# Uso:
#   bash scripts/postprocess.sh <case_dir>
#
# Objetivo:
#   Extraer información mínima de un cálculo ya ejecutado.
#
# TODO reales sugeridos:
#   - extraer energía total final;
#   - resumir geometría optimizada;
#   - calcular distancias/ángulos de adsorción;
#   - exportar tablas CSV para análisis posterior;
#   - integrar análisis vibracional cuando aplique.

CASE_DIR="${1:-.}"

if [[ ! -d "${CASE_DIR}" ]]; then
  echo "ERROR: El directorio no existe: ${CASE_DIR}" >&2
  exit 1
fi

echo "[postprocess] Caso: ${CASE_DIR}"

SUMMARY_FILE="${CASE_DIR}/summary_placeholder.txt"

echo "# Resumen placeholder" > "${SUMMARY_FILE}"
echo "case_dir=${CASE_DIR}" >> "${SUMMARY_FILE}"
echo "generated_at=$(date -Iseconds)" >> "${SUMMARY_FILE}"

if [[ -f "${CASE_DIR}/aims.out" ]]; then
  echo "[postprocess] aims.out encontrado. Intentando extracción simple..."
  {
    echo ""
    echo "## Coincidencias de 'Total energy'"
    grep -n "Total energy" "${CASE_DIR}/aims.out" | tail -n 5 || true
  } >> "${SUMMARY_FILE}"
else
  echo "[postprocess] No se encontró aims.out (placeholder)."
fi

echo "[postprocess] Resumen generado en ${SUMMARY_FILE}"
echo "[postprocess] OK (placeholder)."

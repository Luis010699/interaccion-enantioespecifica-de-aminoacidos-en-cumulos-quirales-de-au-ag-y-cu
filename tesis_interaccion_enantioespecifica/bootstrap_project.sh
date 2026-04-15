#!/usr/bin/env bash
set -euo pipefail

# Nombre de carpeta recomendado: seguro para terminal y GitHub.
# El título visible del proyecto dentro de los archivos sí conserva acentos.
PROJECT_DIR="${1:-interaccion-enantioespecifica-de-aminoacidos-en-cumulos-quirales-de-au-ag-y-cu}"
mkdir -p "$PROJECT_DIR"/{docs,src/julia,src/python,scripts,aims_inputs/templates,aims_inputs/examples/case_001,data/example,figures,results}

cat > "$PROJECT_DIR/README.md" <<'EOT'
# Interacción enantioespecífica de aminoácidos en cúmulos quirales de Au, Ag y Cu

Repositorio para el código, scripts e inputs usados en la tesis de **Luis Manuel Espinoza Martinez**.

## Resumen
Este proyecto reúne materiales de trabajo para un flujo de investigación reproducible asociado a cálculos de química computacional y exploración estructural:

- **Algoritmo de búsqueda aleatoria en Julia** para generar o explorar configuraciones candidatas de adsorción.
- **Archivos de entrada para FHI-aims** orientados a cálculos DFT sobre cúmulos quirales de Au, Ag y Cu.
- **Scripts de preparación y postproceso** para organizar casos, validar entradas y extraer resultados relevantes.

> Estado del repositorio: scaffold inicial presentable para publicación y posterior organización incremental del código real.

## Nombre del proyecto
El **nombre visible del proyecto** es exactamente el título de la tesis:

```text
Interacción enantioespecífica de aminoácidos en cúmulos quirales de Au, Ag y Cu
```

Para GitHub se recomienda usar un nombre de repositorio saneado, estable y sin espacios ni acentos:

```text
Luis010699/interaccion-enantioespecifica-de-aminoacidos-en-cumulos-quirales-de-au-ag-y-cu
```

## Alcance
Este repositorio está pensado para:

- documentar el código y scripts usados en la tesis;
- conservar una estructura estable y entendible;
- facilitar la reproducibilidad mínima del flujo de trabajo;
- evitar subir salidas pesadas o archivos no aptos para control de versiones.

## Estructura del proyecto

```text
.
├── README.md
├── CITATION.cff
├── LICENSE
├── .gitignore
├── docs/
├── src/
│   ├── julia/
│   └── python/
├── scripts/
│   ├── prepare_case.sh
│   └── postprocess.sh
├── aims_inputs/
│   ├── templates/
│   └── examples/
│       └── case_001/
├── data/
│   └── example/
├── figures/
└── results/
    └── README.md
```

## Descripción de carpetas

- `docs/`: notas metodológicas, documentación técnica, esquema de experimentos y material auxiliar.
- `src/julia/`: implementación principal del algoritmo de búsqueda aleatoria y utilidades relacionadas.
- `src/python/`: scripts opcionales de análisis o postproceso en Python.
- `scripts/`: automatización ligera para preparar casos y extraer información básica de resultados.
- `aims_inputs/templates/`: plantillas genéricas de `control.in`, `geometry.in` u otros archivos base.
- `aims_inputs/examples/case_001/`: ejemplo mínimo de un caso de trabajo.
- `data/example/`: datos pequeños de ejemplo que sí pueden versionarse.
- `figures/`: figuras ligeras, esquemas o imágenes derivadas aptas para Git.
- `results/`: directorio reservado para resultados locales; **no se suben outputs pesados**.

## Reproducibilidad mínima

1. Copia un caso base a un directorio de trabajo:

```bash
cp -r aims_inputs/examples/case_001 aims_inputs/work
```

2. Prepara el caso:

```bash
bash scripts/prepare_case.sh aims_inputs/work
```

3. Ejecuta FHI-aims en tu entorno local o clúster:

```bash
cd aims_inputs/work
# ejemplo; ajusta al ejecutable real disponible en tu sistema
# aims.x > aims.out
```

4. Lanza el postproceso básico:

```bash
bash ../../scripts/postprocess.sh .
```

## Configuración recomendada de Git

```bash
git config user.name "Luis Manuel Espinoza Martinez"
git config user.email "luiyi89ko@gmail.com"
```

## Buenas prácticas para este repositorio

- No subir resultados completos de FHI-aims, reinicios, densidades, archivos `.cube`, logs masivos ni binarios.
- No incluir credenciales, llaves SSH, tokens, rutas privadas ni información sensible de infraestructura.
- Mantener `main` como rama estable y `dev` como rama de trabajo.
- Etiquetar la versión citada en la tesis con `v1.0-thesis` cuando el contenido esté congelado.

## Cita
Consulta `CITATION.cff`.

## Licencia
Este scaffold usa licencia MIT por defecto. Revisa que sea compatible con el código, datos y dependencias que finalmente publiques.
EOT

cat > "$PROJECT_DIR/.gitignore" <<'EOT'
# Resultados pesados (no versionar)
results/*
!results/README.md

# Outputs típicos / logs
*.out
*.log
*.tmp

# FHI-aims
aims.out*
restart*
charge_density*
KS_eigenvalues*
*.cube
*.dat

# Sistemas
.DS_Store
Thumbs.db

# Python
__pycache__/
*.pyc
.venv/
.env

# Julia
*.ji
Manifest.toml.backup
EOT

cat > "$PROJECT_DIR/CITATION.cff" <<'EOT'
cff-version: 1.2.0
title: "Interacción enantioespecífica de aminoácidos en cúmulos quirales de Au, Ag y Cu"
message: "Si usas este repositorio, por favor cítalo."
type: software
authors:
  - given-names: "Luis Manuel"
    family-names: "Espinoza Martinez"
    email: "luiyi89ko@gmail.com"
repository-code: "https://github.com/Luis010699/interaccion-enantioespecifica-de-aminoacidos-en-cumulos-quirales-de-au-ag-y-cu"
license: "MIT"
abstract: >-
  Repositorio de código, scripts e inputs asociados al trabajo de tesis sobre
  interacción enantioespecífica de aminoácidos en cúmulos quirales de Au, Ag y Cu,
  incluyendo exploración estructural en Julia y cálculos DFT con FHI-aims.
keywords:
  - DFT
  - FHI-aims
  - Julia
  - quiralidad
  - nanoclusters
  - aminoacidos
  - reproducible research
version: "0.1.0"
date-released: "2026-04-14"
EOT

cat > "$PROJECT_DIR/LICENSE" <<'EOT'
MIT License

Copyright (c) 2026 Luis Manuel Espinoza Martinez

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOT

cat > "$PROJECT_DIR/results/README.md" <<'EOT'
# Resultados

Este directorio se mantiene vacío en GitHub.

- Los outputs completos de FHI-aims pueden ser muy grandes.
- Guarda tus resultados localmente o en un repositorio de datos aparte.
EOT

cat > "$PROJECT_DIR/scripts/prepare_case.sh" <<'EOT'
#!/usr/bin/env bash
set -euo pipefail

# Uso: bash scripts/prepare_case.sh <case_dir>
CASE_DIR="${1:-}"
if [[ -z "${CASE_DIR}" || ! -d "${CASE_DIR}" ]]; then
  echo "ERROR: Debes pasar un directorio de caso existente." >&2
  exit 1
fi

echo "[prepare] Caso: ${CASE_DIR}"
if [[ ! -f "${CASE_DIR}/geometry.in" ]]; then
  echo "WARN: No existe geometry.in en ${CASE_DIR} (placeholder)."
fi
if [[ ! -f "${CASE_DIR}/control.in" ]]; then
  echo "WARN: No existe control.in en ${CASE_DIR} (placeholder)."
fi
echo "[prepare] OK (placeholder)."
EOT

cat > "$PROJECT_DIR/scripts/postprocess.sh" <<'EOT'
#!/usr/bin/env bash
set -euo pipefail

# Uso: bash scripts/postprocess.sh <case_dir>
CASE_DIR="${1:-.}"
if [[ ! -d "${CASE_DIR}" ]]; then
  echo "ERROR: El directorio no existe: ${CASE_DIR}" >&2
  exit 1
fi

echo "[postprocess] Caso: ${CASE_DIR}"
if [[ -f "${CASE_DIR}/aims.out" ]]; then
  echo "[postprocess] aims.out encontrado."
  grep -n "Total energy" "${CASE_DIR}/aims.out" | tail -n 5 || true
else
  echo "[postprocess] No se encontró aims.out (placeholder)."
fi
echo "[postprocess] OK (placeholder)."
EOT

chmod +x "$PROJECT_DIR/scripts/prepare_case.sh" "$PROJECT_DIR/scripts/postprocess.sh"

echo '# Placeholder control.in' > "$PROJECT_DIR/aims_inputs/examples/case_001/control.in"
echo '# Placeholder geometry.in' > "$PROJECT_DIR/aims_inputs/examples/case_001/geometry.in"
echo '# Documentación técnica del proyecto' > "$PROJECT_DIR/docs/README.md"
echo '# Código Julia del algoritmo de búsqueda aleatoria' > "$PROJECT_DIR/src/julia/README.md"
echo '# Código Python para análisis y postproceso opcional' > "$PROJECT_DIR/src/python/README.md"
echo '# Datos mínimos de ejemplo' > "$PROJECT_DIR/data/example/README.md"
echo '# Figuras ligeras aptas para Git' > "$PROJECT_DIR/figures/README.md"

echo "Scaffold creado en: $PROJECT_DIR"
echo "Configura Git con:"
echo "  git config user.name "Luis Manuel Espinoza Martinez""
echo "  git config user.email "luiyi89ko@gmail.com""

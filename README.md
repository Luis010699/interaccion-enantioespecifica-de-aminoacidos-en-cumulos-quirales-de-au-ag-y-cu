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

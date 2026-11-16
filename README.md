# INPC mensual en SQLite

Consultas SQL sobre el Índice Nacional de Precios al Consumidor (INPC) mensual,
publicado por el INEGI. El objetivo es practicar SQL (básico, JOINs, agregaciones,
ventanas y CTE) sobre datos públicos reales.

## Fuente de los datos

- **Fuente:** INEGI, Índice Nacional de Precios al Consumidor (datos abiertos).
- **URL de descarga:** <https://www.inegi.org.mx/datosabiertos/>
  (ruta: Información Económica → Índices de Precios → Índice Nacional de Precios al Consumidor (INPC) → Índice Nacional de Precios al Consumidor y sus principales componentes)
- **Fecha de descarga:** noviembre de 2026.
- **Archivo:** `data/conjunto_de_datos_inpc_mensual.csv` (formato largo: 7 series, 2003-01 a 2025-12, 2002 registros).
- **Nota:** este repositorio usa exclusivamente datos públicos del INEGI. No incluye resultados ni series derivadas de proyectos privados o en preparación para publicación.

## Motor y esquema

- **Motor:** SQLite vía `sqlite3` de Python 3.12. Sin servidor.
- **Esquema:**
  - `conceptos(concepto_id, nombre, grupo, es_agregado)`
  - `precios(fecha, concepto_id, indice)`
- `fecha` es `TEXT` en formato ISO (`YYYY-MM-DD`).

## Estructura del repositorio
sql-inpc/
├── README.md
├── .gitignore
├── cargar_inpc.ipynb # Notebook de carga del CSV a SQLite
├── 01_crear_tablas.sql # Esquema: tablas conceptos y precios
├── 02_consultas_basicas.sql # SELECT, WHERE, BETWEEN, IN, ORDER BY, LIMIT
├── 03_joins_agregaciones.sql # JOIN, GROUP BY, HAVING (pendiente)
├── 04_ventanas_cte.sql # Funciones de ventana y CTE (pendiente)
├── 05_preguntas_negocio.sql # 6–8 preguntas de dificultad creciente (pendiente)
└── data/
├── conjunto_de_datos_inpc_mensual.csv # Datos crudos del INEGI
└── inpc.db # Base generada (ignorada por git)


### Habilidades que demuestra cada archivo

| Archivo | Habilidad |
|---|---|
| `01_crear_tablas.sql` | DDL: `CREATE TABLE`, `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `INDEX`, `PRAGMA foreign_keys` |
| `02_consultas_basicas.sql` | `SELECT`, `WHERE`, `BETWEEN`, `IN`, `ORDER BY`, `LIMIT`, `MIN`, `MAX`, `COUNT` |
| `03_joins_agregaciones.sql` | `JOIN`, `GROUP BY`, `HAVING`, agregaciones |
| `04_ventanas_cte.sql` | `ROW_NUMBER`, `RANK`, `LAG`, media móvil, CTE |
| `05_preguntas_negocio.sql` | Integración de todo en preguntas de análisis del INPC |

## Cómo ejecutar

1. Coloca `conjunto_de_datos_inpc_mensual.csv` en `data/`.
2. Abre `cargar_inpc.ipynb` en Jupyter o VS Code y corre todas las celdas. Esto genera `data/inpc.db`.
3. Ejecuta los archivos `.sql` en orden (01 → 02 → …) con [DB Browser for SQLite](https://sqlitebrowser.org/) o desde Python con `sqlite3`.

Los archivos `03`, `04` y `05` se irán agregando conforme avance el proyecto.


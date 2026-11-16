# INPC mensual en SQLite

Consultas SQL sobre el Índice Nacional de Precios al Consumidor (INPC) mensual,
publicado por el INEGI. El objetivo es practicar SQL (básico, JOINs, agregaciones,
ventanas y CTE) sobre datos públicos reales.

- **Fuente:** INEGI, Índice Nacional de Precios al Consumidor (datos abiertos).
- **URL de descarga:** https://www.inegi.org.mx/datosabiertos/
(Información Económica > Indices de Precios > Índice Nacional de Precios al Consumidor (INPC) > Índice Nacional de Precios al Consumidor y sus principales componentes)
- **Fecha de descarga:** nov-2026
- **Archivo:** `data/conjunto_de_datos_inpc_mensual.csv` (formato largo, 7 series, 2003-01 a 2025-12).
- **Motor:** SQLite vía `sqlite3` de Python 3.12. Sin servidor.
- **Esquema:** `conceptos(concepto_id, nombre, grupo, es_agregado)` y `precios(fecha, concepto_id, indice)`.
  `fecha` es TEXT ISO (`YYYY-MM-DD`).

## Cómo ejecutar

1. Coloca el CSV en `data/`.
2. Abre `cargar_inpc.ipynb` y corre todas las celdas. Genera `data/inpc.db`.
3. Ejecuta los archivos `.sql` en orden con DB Browser for SQLite o desde Python.

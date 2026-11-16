-- =============================================================================
-- 02_consultas_basicas.sql
-- Consultas introductorias sobre las tablas conceptos y precios.
-- Conceptos SQL cubiertos: SELECT, WHERE, BETWEEN, IN, ORDER BY, LIMIT,
-- MIN, MAX, COUNT, comentarios (-- y /* */).
-- Cada bloque tiene: pregunta → consulta → qué muestra el resultado.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- P1. ¿Qué conceptos hay en la base y a qué grupo pertenece cada uno?
-- Concepto SQL: SELECT con columnas explícitas + ORDER BY.
-- -----------------------------------------------------------------------------
SELECT concepto_id,
       nombre,
       grupo,
       es_agregado
FROM conceptos
ORDER BY concepto_id;

-- Resultado: 7 filas, una por serie del INPC, con su grupo (General,
-- Subyacente, No subyacente) y la bandera es_agregado (1 = agregado, 0 = componente).

-- -----------------------------------------------------------------------------
-- P2. ¿Qué periodo cubre la base y cuántos registros hay en total?
-- Concepto SQL: funciones de agregación MIN, MAX y COUNT sobre toda la tabla.
-- -----------------------------------------------------------------------------
SELECT MIN(fecha)  AS fecha_inicial,
       MAX(fecha)  AS fecha_final,
       COUNT(*)    AS total_registros,
       COUNT(DISTINCT concepto_id) AS conceptos_distintos
FROM precios;

-- Resultado: una sola fila con fecha_inicial = 2003-01-01, fecha_final =
-- 2025-12-01, 2002 registros y 7 conceptos distintos.

-- -----------------------------------------------------------------------------
-- P3. ¿Cómo evolucionó el INPC general durante 2024, mes a mes?
-- Concepto SQL: WHERE con dos condiciones unidas por AND + BETWEEN + ORDER BY.
-- -----------------------------------------------------------------------------
SELECT fecha,
       indice
FROM precios
WHERE concepto_id = 1
  AND fecha BETWEEN '2024-01-01' AND '2024-12-01'
ORDER BY fecha;

-- Resultado: 12 filas (una por mes de 2024) con el índice del INPC general,
-- ordenadas cronológicamente de enero a diciembre.

-- -----------------------------------------------------------------------------
-- P4. ¿Cuánto valían el INPC general y el subyacente en diciembre de 2024?
-- Concepto SQL: WHERE con IN (lista de valores) + ORDER BY por columna.
-- -----------------------------------------------------------------------------
SELECT concepto_id,
       fecha,
       indice
FROM precios
WHERE concepto_id IN (1, 2)
  AND fecha = '2024-12-01'
ORDER BY concepto_id;

-- Resultado: 2 filas, una para el INPC general (concepto_id = 1) y otra para
-- el subyacente (concepto_id = 2), ambas en diciembre de 2024.

-- -----------------------------------------------------------------------------
-- P5. ¿En qué tres meses el INPC general alcanzó su nivel más alto?
-- Concepto SQL: ORDER BY ... DESC + LIMIT (top-N).
-- -----------------------------------------------------------------------------
SELECT fecha,
       indice
FROM precios
WHERE concepto_id = 1
ORDER BY indice DESC
LIMIT 3;

-- Resultado: 3 filas con los meses de mayor índice del INPC general,
-- probablemente los últimos meses de 2025 por la tendencia creciente del índice.

-- -----------------------------------------------------------------------------
-- P6. ¿Cuál fue el primer y el último valor del índice No subyacente en la base?
-- Concepto SQL: WHERE con IN sobre fechas exactas (dos valores concretos).
-- -----------------------------------------------------------------------------
SELECT fecha,
       indice
FROM precios
WHERE concepto_id = 3
  AND fecha IN ('2003-01-01', '2025-12-01')
ORDER BY fecha;

-- Resultado: 2 filas, la primera (2003-01-01) y la última (2025-12-01)
-- observación del índice No subyacente.


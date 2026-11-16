-- 01_crear_tablas.sql
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS precios;
DROP TABLE IF EXISTS conceptos;

CREATE TABLE conceptos (
    concepto_id  INTEGER PRIMARY KEY,
    nombre       TEXT    NOT NULL,
    grupo        TEXT    NOT NULL,
    es_agregado  INTEGER NOT NULL CHECK (es_agregado IN (0, 1))
);

CREATE TABLE precios (
    fecha        TEXT    NOT NULL,
    concepto_id  INTEGER NOT NULL,
    indice       REAL    NOT NULL,
    PRIMARY KEY (fecha, concepto_id),
    FOREIGN KEY (concepto_id) REFERENCES conceptos(concepto_id)
);

CREATE INDEX idx_precios_concepto ON precios(concepto_id);
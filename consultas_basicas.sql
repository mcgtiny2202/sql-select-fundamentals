--══════════════════════════════════════════
-- TechStore — Consultas Básicas SELECT
-- Autor: Maria Cristina Gaupmann
-- Fecha: 26/07/2026
-- ══════════════════════════════════════════
-- Consulta 1: Exploración general de la tabla sales
SELECT * FROM sales; --Se utiliza SELECT cuando se quiere obtener la totalidad de las columnas de la tabla.  NO se usa cuando se quieren obtener columnas específicas.
-- Consulta 2: Selección de columnas específicas para finanzas
SELECT customer_id, product_id, total_amount from sales;
-- Consulta 3: Selección con alias en español para stakeholders
SELECT order_date AS fecha_pedido, product_name AS nombre_producto, quantity AS cantidad_unidades 
FROM sales;

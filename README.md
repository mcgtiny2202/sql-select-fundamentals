# SQL Select Fundamentals

Este repositorio contiene las bases y buenas prácticas para la selección de datos en SQL.

## 🚫 ¿Por qué NO usar `SELECT *` en producción?

El uso de `SELECT *` debe evitarse en entornos reales por tres razones fundamentales:

### 1. ⚡ Rendimiento
* **Saturación de red:** Envía columnas pesadas de forma innecesaria, consumiendo ancho de banda.
* **Ignora índices:** Obliga al motor a leer todo el disco duro en lugar de usar búsquedas rápidas en memoria RAM.

### 2. 🛠️ Mantenibilidad
* **Código frágil:** Si la estructura de la tabla cambia (se añade o elimina una columna), la aplicación puede romperse.
* **Ambigüedad:** Al usar `JOIN`, se duplican nombres de columnas (como `id`), generando errores en el backend.

### 3. 🔒 Seguridad
* **Exposición de datos:** Trae información confidencial innecesaria (contraseñas encriptadas, tokens, etc.) a la memoria de la aplicación.
* **Principio de menor privilegio:** Viola la regla de acceder solo a los datos estrictamente necesarios.

---

## 👔 Los Alias (`AS`) y los Stakeholders no Técnicos

Los alias no solo sirven para acortar nombres en el código; son la herramienta clave para traducir datos técnicos en términos de negocio comprensibles para directores, gerentes o el equipo de Finanzas.

### ¿Por qué son importantes?
* **Evitan errores de interpretación:** El equipo de negocio no tiene por qué descifrar códigos internos de la base de datos.
* **Reportes listos para usar:** Los datos exportados a Excel o PDF quedan limpios y listos para una presentación ejecutiva sin necesidad de edición manual.

### 📊 Ejemplo Práctico: Transformando datos para Finanzas

Si Finanzas solicita un reporte de ventas y enviamos los nombres técnicos de las columnas, el resultado puede ser confuso:

```sql
-- 🚫 SIN ALIAS: Confuso para el negocio
SELECT id_usr, track_no, total_amount FROM fact_sales;
```

**Resultado generado:**

| id_usr | track_no | total_amount |
| :--- | :--- | :--- |
| 1024 | TRK-99281 | 15450.00 |
*(Finanzas se preguntará: ¿`total_amount` incluye impuestos? ¿Es neto? ¿En qué moneda está?)*

Al aplicar **Alias (`AS`)**, transformamos la tabla en una herramienta clara de toma de decisiones:

```sql
--  CON ALIAS: Claridad absoluta para el negocio
SELECT 
    id_usr AS "ID de Cliente",
    track_no AS "Número de Factura",
    total_amount AS "Monto Total con IVA (ARS)"
FROM fact_sales;
```

**Resultado generado:**

| ID de Cliente | Número de Factura | Monto Total con IVA (ARS) |
| :--- | :--- | :--- |
| 1024 | TRK-99281 | 15450.00 |

Ahora cualquier persona del área financiera entiende al instante que la cifra corresponde al monto final en pesos argentinos con el impuesto ya incluido.


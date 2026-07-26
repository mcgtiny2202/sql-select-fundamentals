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



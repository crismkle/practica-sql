SELECT current_date();

SELECT current_timestamp();

SELECT year(current_timestamp());

SELECT month(current_timestamp());

SELECT monthname(current_timestamp());

SELECT DATEDIFF(current_timestamp(), "2025-01-01") AS DIFERENCIA_DE_DIAS;

SELECT current_timestamp() AS DIA_HOY, DATE_SUB(current_timestamp(), INTERVAL 1 MONTH) AS RESULTADO;

SELECT DISTINCT FECHA_VENTA,
DAYNAME(FECHA_VENTA) AS DÍA, MONTHNAME(FECHA_VENTA) AS MES, YEAR(FECHA_VENTA) AS AÑO
FROM FACTURAS;

# Haz una consulta que muestre el nombre y la edad actual del cliente.

SELECT NOMBRE, floor(DATEDIFF(current_date(), FECHA_DE_NACIMIENTO) / 365.2524) AS EDAD
FROM TABLA_DE_CLIENTES;

# o

SELECT NOMBRE, TIMESTAMPDIFF(YEAR,FECHA_DE_NACIMIENTO, current_date()) AS EDAD
FROM TABLA_DE_CLIENTES;
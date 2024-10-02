SELECT (34+346-67)/15 * 29 AS RESULTADO;

SELECT CEILING(23.456);

SELECT RAND() AS RESULTADO;

SELECT ROUND(25.454, 1) AS RESULTADO;

SELECT NUMERO, CANTIDAD, PRECIO, ROUND(CANTIDAD * PRECIO, 2) AS FACTURACIÓN FROM items_facturas;

# En la tabla de facturas tenemos el valor del impuesto.
# En la tabla de ítems tenemos la cantidad y la facturación.
# Calcula el valor del impuesto pago en el año de 2016 redondeando al menor entero.

SELECT YEAR(FECHA_VENTA), FLOOR(SUM(F.IMPUESTO * (I.CANTIDAD * I.PRECIO))) AS IMPUESTO_PAGO FROM FACTURAS F
INNER JOIN ITEMS_FACTURAS I
ON F.NUMERO = I.NUMERO
WHERE YEAR(F.FECHA_VENTA) = 2016
GROUP BY YEAR(FECHA_VENTA);


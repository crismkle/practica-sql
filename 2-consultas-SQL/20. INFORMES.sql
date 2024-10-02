SELECT * FROM FACTURAS;

SELECT * FROM ITEMS_FACTURAS;

SELECT F.DNI, F.FECHA_VENTA, I.CANTIDAD FROM FACTURAS F
INNER JOIN ITEMS_FACTURAS I
ON F.NUMERO = I.NUMERO;

SELECT F.DNI, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y") AS MES_AÑO, I.CANTIDAD FROM FACTURAS F
INNER JOIN ITEMS_FACTURAS I
ON F.NUMERO = I.NUMERO;

# CANTIDAD DE VENTAS POR MES PARA CADA CLIENTE

SELECT F.DNI, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y") AS MES_AÑO, SUM(I.CANTIDAD) AS CANTIDAD_VENDIDA FROM FACTURAS F
INNER JOIN ITEMS_FACTURAS I
ON F.NUMERO = I.NUMERO
GROUP BY
F.DNI,  DATE_FORMAT(F.FECHA_VENTA, "%m - %Y");

/* CLIENTES CON VENTAS INVÁLIDAS */

SELECT F.DNI, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y") AS MES_AÑO, SUM(I.CANTIDAD) AS CANTIDAD_VENDIDA FROM FACTURAS F
INNER JOIN ITEMS_FACTURAS I
ON F.NUMERO = I.NUMERO
GROUP BY
F.DNI,  DATE_FORMAT(F.FECHA_VENTA, "%m - %Y")
HAVING SUM(I.CANTIDAD) > 10000;

/*
Complementa este informe listando solamente a los que tuvieron ventas inválidas y calcula la diferencia
entre el límite de venta máximo y la cantidad vendida en porcentuales.
Tips:
Utiliza el comando SQL empleado al final del video.
Filtra solamente las líneas donde: (A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA) < 0
Lista el campo X.CANTIDAD_LIMITE
Crea nuevo campo ejecutando la fórmula: (1 - (X.CANTIDAD_LIMITE/X.CANTIDAD_VENDAS)) * 100.
 */



/* LIMITE DE VENTAS POR CLIENTE (VOLUMEN EN DECILITROS) */

SELECT * FROM TABLA_DE_CLIENTES T;

SELECT DNI, NOMBRE, VOLUMEN_DE_COMPRA FROM tabla_de_clientes TC;

SELECT A.DNI, A.NOMBRE, A.MES_AÑO, A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA AS DIFERENCIA
FROM (
SELECT F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y") AS MES_AÑO,
SUM(I.CANTIDAD) AS CANTIDAD_VENDIDA, MAX(VOLUMEN_DE_COMPRA) / 10 AS CANTIDAD_MAXIMA
FROM FACTURAS F
INNER JOIN ITEMS_FACTURAS I
ON F.NUMERO = I.NUMERO
INNER JOIN
tabla_de_clientes TC
ON TC.DNI = F.DNI
GROUP BY
F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y")) A;

/* CON COLUMNA DE STATUS_VENTA */

SELECT A.DNI, A.NOMBRE, A.MES_AÑO, A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA AS DIFERENCIA,
CASE
	WHEN (A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA) <= 0 THEN 'Venta válida'
    ELSE 'Venta inválida'
END AS STATUS_VENTA
FROM (
SELECT F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y") AS MES_AÑO,
SUM(I.CANTIDAD) AS CANTIDAD_VENDIDA, MAX(VOLUMEN_DE_COMPRA) / 10 AS CANTIDAD_MAXIMA
FROM FACTURAS F
INNER JOIN ITEMS_FACTURAS I
ON F.NUMERO = I.NUMERO
INNER JOIN
tabla_de_clientes TC
ON TC.DNI = F.DNI
GROUP BY
F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y")) A;


/* Ahora lista solamente a los que tuvieron ventas inválidas en el año 2018
excediendo más del 50% de su límite permitido por mes.
Calcula la diferencia entre el límite de venta máximo y la cantidad vendida, en porcentuales. */

SELECT A.DNI, A.NOMBRE, A.MES_AÑO, 
A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA AS DIFERENCIA,
CASE
   WHEN  (A.CANTIDAD_VENDIDA - A.CANTIDAD_MAXIMA) <= 0 THEN 'Venta Válida'
   ELSE 'Venta Inválida'
END AS STATUS_VENTA, ROUND((1 - (A.CANTIDAD_MAXIMA/A.CANTIDAD_VENDIDA)) * 100,2) AS PORCENTAJE
 FROM(
SELECT F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y") AS MES_AÑO, 
SUM(IFa.CANTIDAD) AS CANTIDAD_VENDIDA, 
MAX(VOLUMEN_DE_COMPRA)/10 AS CANTIDAD_MAXIMA  
FROM facturas F 
INNER JOIN 
items_facturas IFa
ON F.NUMERO = IFa.NUMERO
INNER JOIN 
tabla_de_clientes TC
ON TC.DNI = F.DNI
GROUP BY
F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y"))A
WHERE (A.CANTIDAD_MAXIMA - A.CANTIDAD_VENDIDA) < 0 AND ROUND((1 - (A.CANTIDAD_MAXIMA/A.CANTIDAD_VENDIDA)) * 100,2) >= 50
AND A.MES_AÑO LIKE "%2018";




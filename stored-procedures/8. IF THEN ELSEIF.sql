DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `precio_producto`(vcodigo VARCHAR(20))
BEGIN
DECLARE vresultado VARCHAR(40);
DECLARE vprecio FLOAT;
SELECT precio_de_lista INTO vprecio FROM tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO = vcodigo;

IF vprecio >= 12
THEN SET vresultado = 'Producto costoso';
ELSEIF vprecio >= 7 AND vprecio < 12
THEN SET vresultado = 'Producto asequible';
ELSE
SET vresultado = 'Producto barato';
END IF;
SELECT vresultado;
END $$


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `comparacion_ventas`(fecha1 DATE, fecha2 DATE)
BEGIN
DECLARE variacion FLOAT;
DECLARE total1, total2 FLOAT;
DECLARE resultado VARCHAR(10);

SELECT SUM(B.CANTIDAD * B.PRECIO) INTO total1 FROM 
facturas A INNER JOIN items_facturas B
ON A.NUMERO = B.NUMERO
WHERE A.FECHA_VENTA = fecha1;

SELECT SUM(B.CANTIDAD * B.PRECIO) INTO total2 FROM 
facturas A INNER JOIN items_facturas B
ON A.NUMERO = B.NUMERO
WHERE A.FECHA_VENTA = fecha2;

SET variacion = ((total2 / total1) - 1) * 100;
IF variacion > 10
THEN SET resultado = 'Verde';
ELSEIF variacion >= -10 AND variacion <= 10
THEN SET resultado = 'Amarillo';
ELSE
SET resultado = 'Rojo';
END IF;

SELECT resultado;

END $$



SELECT * FROM tabla_de_productos;

/*
precio > 12 producto costoso.
precio > 7 y precio < 12 producto asequible.
precio < 7 producto barato.
 */
 
SELECT precio_de_lista FROM tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO = '1000800';

CALL precio_producto('1000801');
CALL precio_producto('1013793');
CALL precio_producto('1096818');

/*
SELECT SUM(B.CANTIDAD * B.PRECIO) AS TOTAL_VENTA FROM 
facturas A INNER JOIN items_facturas B
ON A.NUMERO = B.NUMERO
WHERE A.FECHA_VENTA = '20170301';

Esta consulta devuelve el valor de la facturación en una fecha determinada.

Construye un Stored Procedure llamado comparacion_ventas que compare las ventas
en dos fechas distintas (Estas fechas serán los parámetros de la SP).
Si la variación porcentual de estas ventas es mayor al 10% la respuesta debe ser ‘Verde’.
Si está entre -10% y 10% debe retornar ‘Amarillo’. Si la variación es menor al -10% debe retornar ‘Rojo’.
*/

CALL comparacion_ventas('2017-03-01', '2017-03-05');
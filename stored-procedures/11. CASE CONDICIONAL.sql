DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `precio_producto_case`(vcodigo VARCHAR(20))
BEGIN
DECLARE vresultado VARCHAR(40);
DECLARE vprecio FLOAT;
SELECT precio_de_lista INTO vprecio FROM tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO = vcodigo;
CASE
WHEN vprecio >=12 THEN SET vresultado = 'Producto costoso';
WHEN vprecio >= 7 AND vprecio < 12 THEN SET vresultado = 'Producto asequible';
WHEN vprecio < 7 THEN SET vresultado = 'Producto barato';
END CASE;
SELECT vresultado;
END
$$

CALL precio_producto_case('1000801');
CALL precio_producto_case('1013793');
CALL precio_producto_case('1096818');
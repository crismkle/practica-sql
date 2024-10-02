DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_sabor`(vcodigo VARCHAR(15))
BEGIN
DECLARE vsabor VARCHAR(20);
SELECT SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;
SELECT vsabor;
END $$


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cantidad_facturas`(fecha DATE)
BEGIN
DECLARE N_FACTURAS INTEGER;
SELECT COUNT(*) INTO N_FACTURAS FROM facturas WHERE fecha_venta = fecha;
SELECT N_FACTURAS;
END $$



SELECT CODIGO_DEL_PRODUCTO, SABOR FROM tabla_de_productos;

SELECT SABOR FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = "1078680";

CALL mostrar_sabor('1101035');

/* 
Crea una variable llamada N_FACTURAS y atribuye a ella el número de facturas del día 01/01/2017.
Muestra en el output del script el valor de la variable. (Nombra este Stored Procedure como cantidad_facturas).
*/

SELECT * FROM facturas WHERE FECHA_VENTA = '2017-01-01';

CALL cantidad_facturas('2017-01-01');
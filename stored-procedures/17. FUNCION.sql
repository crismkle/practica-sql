/* Cambiar el valor para permitir crear nuevas funciones */
SET GLOBAL log_bin_trust_function_creators = 1;

SELECT f_define_sabor('Maracuyá');

SELECT nombre_del_producto, sabor, f_define_sabor(sabor) AS TIPO FROM tabla_de_productos;

SELECT nombre_del_producto, sabor FROM tabla_de_productos
WHERE f_define_sabor(sabor) = 'Muy Rico';

/*
Vea el Stored Procedure a continuación:

DELIMITER $$
CREATE PROCEDURE `sp_numero_facturas` ()
BEGIN
DECLARE n_facturas INT;
SELECT COUNT(*) INTO n_facturas FROM facturas WHERE FECHA_VENTA = '20170101';
SELECT n_facturas;
END $$

Transforma este SP en una función donde ingresamos como parámetro la fecha
y retornamos el número de facturas. Llamaremos esta función f_numero_facturas.
Luego de crear la función, ejecútalo utilizando el comando SELECT.
*/

SELECT f_numero_facturas('2017-01-01') AS CANTIDAD_FACTURAS;

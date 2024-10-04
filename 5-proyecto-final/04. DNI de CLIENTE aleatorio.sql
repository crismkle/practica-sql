SELECT COUNT(*) FROM clientes;

SELECT * FROM clientes;

SELECT * FROM clientes LIMIT 5;

-- Un registro luego del 5to
SELECT * FROM clientes LIMIT 5,1;

-- Devuelve el primero
SELECT * FROM clientes LIMIT 0,1;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `f_cliente_aleatorio`() RETURNS varchar(11) CHARSET utf8mb4
BEGIN
	DECLARE vresultado VARCHAR(11);
    DECLARE vmax INT;
    DECLARE valeatorio INT;
    SELECT COUNT(*) INTO vmax FROM clientes;
    SET valeatorio = f_aleatorio(1, vmax);
    /* Para que cuente los límites */
    SET valeatorio = valeatorio - 1;
    SELECT DNI INTO vresultado FROM clientes LIMIT valeatorio, 1;
    RETURN vresultado;
RETURN 1;
END $$

SELECT f_cliente_aleatorio() AS CLIENTE;


/*
En el video de esta aula creamos una función para obtener el cliente a través de la función de número aleatorio.
En este ejercicio, crea otra función para obtener el producto y también el vendedor
usando como base la función aleatorio.
*/


DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `f_producto_aleatorio`() RETURNS int
BEGIN
	DECLARE vresultado VARCHAR(10);
    DECLARE valeatorio INT;
    DECLARE vmax INT;
    SELECT COUNT(*) INTO vmax FROM productos;
    SELECT f_aleatorio(1, vmax) INTO valeatorio;
    SET valeatorio = valeatorio - 1;
    SELECT codigo INTO vresultado FROM productos LIMIT valeatorio, 1;
	RETURN vresultado;
END $$

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `f_vendedor_aleatorio`() RETURNS int
BEGIN
	DECLARE vresultado VARCHAR(5);
    DECLARE valeatorio INT;
    DECLARE vmax INT;
    SELECT COUNT(*) INTO vmax FROM vendedores;
    SELECT f_aleatorio(1, vmax) INTO valeatorio;
    SET valeatorio = valeatorio - 1;
	SELECT MATRICULA INTO vresultado FROM vendedores LIMIT valeatorio, 1;
	RETURN vresultado;
END $$


SELECT * FROM productos;
SELECT f_producto_aleatorio() AS PRODUCTO;

SELECT * FROM vendedores;
SELECT f_vendedor_aleatorio() AS VENDEDOR;
-- Algoritmo para generar números aleatorios con Rand()
-- Se usará para generar una venta ficticia con valores aleatorios de nuestras tablas
-- MIN = 20 Y MAX = 250
-- (RAND() * (MAX - MIN + 1)) + MIN

SELECT (RAND() * (250 - 20 + 1)) + 20 AS ALEATORIO;

SELECT FLOOR((RAND() * (250 - 20 + 1)) + 20) AS ALEATORIO;

/* Recordar tener seteado el set global para funciones */

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `f_aleatorio`(min INT, max INT) RETURNS int
BEGIN
	DECLARE vresultado INT;
    SELECT FLOOR((RAND() * (max - min + 1)) + min) INTO vresultado;
	RETURN vresultado;
END $$

SELECT f_aleatorio(1, 10 ) AS RESULTADO;

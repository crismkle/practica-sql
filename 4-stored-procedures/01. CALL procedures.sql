DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `hola_mundo`()
BEGIN
	SELECT "Hola Mundo!!!";
END $$


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `muestra_numero`()
BEGIN
	SELECT (9+5)*2 AS RESULTADO;
END $$


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `concatenar`()
BEGIN
	SELECT CONCAT('Hola mundo', " ", '!!!!') AS RESULTADO;
END $$


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `concatenar_con_comentarios`()
BEGIN
	/* 
    Este es un ejemplo de comentario
    al interior de un procedure
    */
    
    -- Así se comenta un store procedure
	SELECT CONCAT("Hola a todos!!!", ' ', ' Este procedure concatena strings') AS RESULTADO2;
END $$


CALL hola_mundo;

CALL muestra_numero;

CALL concatenar;

CALL concatenar_con_comentarios;
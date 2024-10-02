DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_looping`()
BEGIN
	DECLARE fin_c INT DEFAULT 0;    
	DECLARE vnombre VARCHAR(50);
    DECLARE c CURSOR FOR SELECT nombre FROM tabla_de_clientes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET fin_c = 1;
    OPEN c;
    WHILE fin_c = 0
    DO
    FETCH c INTO vnombre;
    IF fin_c = 0
    THEN SELECT vnombre;
    END IF;
    END WHILE;
    CLOSE c;
END $$


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_limite_total`()
BEGIN
	DECLARE fin_c INT DEFAULT 0;    
	DECLARE vlimite_credito FLOAT;
    DECLARE vlimite_total FLOAT DEFAULT 0.0;
    DECLARE c CURSOR FOR SELECT limite_de_credito FROM tabla_de_clientes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_c = 1;
    OPEN c;
    WHILE fin_c = 0
    DO
		FETCH c INTO vlimite_credito;
		IF fin_c = 0
			THEN SET vlimite_total = vlimite_total + vlimite_credito;
		END IF;
    END WHILE;
    CLOSE c;
    SELECT vlimite_total;
END $$



CALL cursor_looping;

SELECT nombre FROM tabla_de_clientes; 



/*
Crea un Stored Procedure usando un cursor para hallar el valor total de todos los créditos
de todos los clientes. Llamaremos este SP como: limite_creditos.

Tip:
Declara dos variables: Una que recibe el límite de crédito del cursor y otra el límite de crédito total;
haz un loop en el cursor y ve sumando en la variable límite de crédito total
el valor del límite de cada cliente; Exhibe el valor total del límite.
*/

SELECT DNI, LIMITE_DE_CREDITO FROM tabla_de_clientes;

CALL cursor_limite_total;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `exhibir_variable`()
BEGIN
	DECLARE texto CHAR(20) DEFAULT 'Hola Mundo!!!';
    SELECT texto;
END $$


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `prueba_variables`()
BEGIN
DECLARE v VARCHAR(30) DEFAULT "Caracteres variables";
DECLARE i INTEGER DEFAULT 564;
DECLARE d DECIMAL(5,3) DEFAULT 89.765;
DECLARE f DATE DEFAULT "2021-01-01";
DECLARE ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP();
SELECT v;
SELECT i;
SELECT d;
SELECT f;
SELECT ts;
END $$


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `atribuir_valores`()
BEGIN
DECLARE numero INTEGER DEFAULT 987;
SELECT numero;
SET numero = 324;
SELECT numero;
END $$


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `prueba_variables2`()
BEGIN
DECLARE cliente VARCHAR(10);
DECLARE edad INTEGER;
DECLARE fecha_nacimiento DATE;
DECLARE costo DECIMAL(4,2);

SET cliente = 'Juan';
SET edad = 10;
SET fecha_nacimiento = "2007-01-10";
SET costo = 10.23;

SELECT cliente;
SELECT edad;
SELECT fecha_nacimiento;
SELECT costo;
END $$


CALL exhibir_variable;

CALL prueba_variables;

CALL atribuir_valores;

CALL prueba_variables2;
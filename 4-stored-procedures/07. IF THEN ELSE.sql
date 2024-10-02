DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `edad_clientes`(vdni VARCHAR(20))
BEGIN
DECLARE vresultado VARCHAR(50);
DECLARE vfecha DATE;
SELECT FECHA_DE_NACIMIENTO INTO vfecha FROM tabla_de_clientes
WHERE DNI = vdni;
IF
vfecha < '19950101'
THEN
SET vresultado = 'Cliente viejo';
ELSE
SET vresultado = 'Cliente joven';
END IF;
SELECT vresultado;
END $$


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `evaluacion_facturas`(fecha DATE)
BEGIN
DECLARE cantidad INTEGER;
DECLARE resultado VARCHAR(20);
SELECT COUNT(*) INTO cantidad FROM facturas
WHERE fecha_venta = fecha;
IF
	cantidad > 70 
THEN
SET	resultado = "Muchas facturas";
ELSE
SET	resultado = "Pocas facturas";
END IF;
SELECT cantidad;
SELECT resultado;
END $$



SELECT * FROM tabla_de_clientes;

SELECT FECHA_DE_NACIMIENTO FROM tabla_de_clientes
WHERE DNI = '1471156710';

CALL edad_clientes(50534475787);

CALL edad_clientes(1471156710);


/*
Crea un Stored Procedure que, basado en una fecha, calcule el número de facturas.
Si aparecen más de 70 facturas exhibimos el mensaje: ‘Muchas facturas’.
En otro caso, exhibimos el mensaje ‘Pocas facturas’. También, debe exhibir el número de facturas.
Llamaremos este Stored Procedure como: evaluacion_facturas.
La fecha empleada para evaluar la cantidad de facturas será un parámetro del Stored Procedure.
*/

SELECT * FROM facturas;

CALL evaluacion_facturas('2016-09-02');
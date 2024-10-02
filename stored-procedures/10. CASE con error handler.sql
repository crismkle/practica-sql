DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `define_sabor_con_error`(vcodigo VARCHAR(20))
BEGIN
DECLARE vsabor VARCHAR(20);
DECLARE mensajeError VARCHAR(50);
DECLARE CONTINUE HANDLER FOR 1339
SET MensajeError = 'Sabor no definido en ningún caso';
SELECT SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;

CASE vsabor
WHEN 'Maracuyá' THEN SELECT 'Muy Rico';
WHEN 'Limón' THEN SELECT 'Muy Rico';
WHEN 'Frutilla' THEN SELECT 'Muy Rico';
WHEN 'Uva' THEN SELECT 'Muy Rico';
WHEN 'Sandía' THEN SELECT 'Normal';
WHEN 'Mango' THEN SELECT 'Normal';
END CASE;
SELECT mensajeError;
END $$


SELECT SABOR, CODIGO_DEL_PRODUCTO FROM tabla_de_productos;

CALL define_sabor_con_error('1000800');


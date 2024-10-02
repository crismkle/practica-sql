DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `define_sabor`(vcodigo VARCHAR(20))
BEGIN
DECLARE vsabor VARCHAR(20);
SELECT SABOR INTO vsabor FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = vcodigo;

CASE vsabor
WHEN 'Maracuyá' THEN SELECT 'Muy Rico';
WHEN 'Limón' THEN SELECT 'Muy Rico';
WHEN 'Frutilla' THEN SELECT 'Muy Rico';
WHEN 'Uva' THEN SELECT 'Muy Rico';
WHEN 'Sandía' THEN SELECT 'Normal';
WHEN 'Mango' THEN SELECT 'Normal';
ELSE SELECT 'Jugos comunes';
END CASE;
END $$


SELECT DISTINCT sabor FROM tabla_de_productos;

/* 
Maracuyá Rico
Limón Rico
Frutilla Rica
Uva Rico
Sandía Normal
Mango Normal
Los demás Comunes
*/

SELECT SABOR FROM tabla_de_productos WHERE CODIGO_DEL_PRODUCTO = '1002767';

CALL define_sabor('1002767');
CALL define_sabor('544931');
CALL define_sabor('243083');
CALL define_sabor('1096818');
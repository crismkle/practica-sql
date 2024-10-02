DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `problema_select_into`()
BEGIN
	DECLARE vnombre VARCHAR(50);
    SELECT nombre INTO vnombre FROM tabla_de_clientes;
    SELECT vnombre;

END $$



CALL problema_select_into;
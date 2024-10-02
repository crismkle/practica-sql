DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_looping_varios_camos`()
BEGIN
	DECLARE fin_c INT DEFAULT 0;    
	DECLARE vbarrio, vciudad, vestado, vcp VARCHAR(50);
	DECLARE vnombre, vdireccion  VARCHAR(150);
    DECLARE c CURSOR FOR SELECT nombre, direccion_1, barrio, ciudad, estado, cp FROM tabla_de_clientes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_c = 1;
    OPEN c;
    WHILE fin_c = 0
    DO
		FETCH c INTO vnombre, vdireccion, vbarrio, vciudad, vestado, vcp;
		IF fin_c = 0
			THEN SELECT CONCAT(vnombre, ' Dirección: ', vdireccion, ' - ', vbarrio, ' - ', vciudad, ' - ', vestado, ' - ', vcp) AS RESULTADO;
		END IF;
    END WHILE;
    CLOSE c;
END $$


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `campo_adicional`(mes INT, ano INT)
BEGIN
	DECLARE fin_c INT DEFAULT 0;
	DECLARE vprecio FLOAT;
	DECLARE vsuma FLOAT DEFAULT 0.0;
	DECLARE vcantidad INT;
    DECLARE c CURSOR FOR SELECT IFa.CANTIDAD, IFa.PRECIO FROM items_facturas IFa
						INNER JOIN facturas F ON F.NUMERO = IFa.NUMERO
                        WHERE MONTH(F.FECHA_VENTA) = mes AND YEAR(F.FECHA_VENTA) = ano;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_c = 1;
    OPEN c;
    WHILE fin_c = 0
    DO
		FETCH c INTO vcantidad, vprecio;
		IF fin_c = 0
			THEN SET vsuma = vsuma + (vcantidad * vprecio);
		END IF;
    END WHILE;
    CLOSE c;
    SELECT vsuma AS RESULTADO;
END $$


SELECT * FROM tabla_de_clientes;

CALL cursor_looping_varios_camos;




/*
Crea un Stored Procedure usando un cursor para hallar
el valor total de la facturación para un determinado mes y año.

Tips:
Declara tres variables: Una que recibe la cantidad, otra el precio y otra que va a acumular la facturación;
Haz un loop en el cursor e ve sumando el valor de facturación en cada factura;
Exhibe el valor total del límite; Recuerda que la consulta quiere obtener la facturación de un mes y año.
El comando a continuación muestra todas las facturas generadas en enero de 2017:

SELECT IFa.CANTIDAD, IFa.PRECIO FROM items_facturas IFa
INNER JOIN facturas  F ON F.NUMERO = IFa.NUMERO
WHERE MONTH(F.FECHA_VENTA) = 1 AND YEAR(F.FECHA_VENTA) = 2017;

Llamaremos este Stored Procedure como: campo_adicional.
*/

CALL campo_adicional(1, 2017);
-- Facturación para un día específico
SELECT A.FECHA, SUM(B.CANTIDAD*B.PRECIO) AS FACTURACION
FROM facturas A
INNER JOIN
items B
ON A.NUMERO = B.NUMERO
WHERE A.FECHA = '20240619'
GROUP BY A.FECHA;

CALL sp_venta('20240619', 8, 50);

SELECT COUNT(*) FROM productos;

-- A mayor cantidad de productos, es más probable que se repita uno
-- Por lo tanto, se repetiría la clave primaria en la tabla Items
CALL sp_venta('20240619', 20, 50);

DROP PROCEDURE IF EXISTS sp_venta;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_venta`(fecha DATE, maxitems INT, maxcant INT)
BEGIN
	DECLARE vcliente VARCHAR(11);
    DECLARE vproducto VARCHAR(10);
    DECLARE vvendedor VARCHAR(5);
    DECLARE vcantidad INT;
    DECLARE vprecio FLOAT;
    DECLARE vitems INT;
    DECLARE vnfactura INT;
    DECLARE vcontador INT DEFAULT 1;
    DECLARE vnumitems INT;
    -- NUMERO es secuencial, busca el max y le suma 1
    SELECT MAX(NUMERO) + 1 INTO vnfactura FROM facturas;
    SET vcliente = f_cliente_aleatorio();
    SET vvendedor = f_vendedor_aleatorio();
    INSERT INTO facturas(NUMERO, FECHA, DNI, MATRICULA, IMPUESTO) VALUES (
    vnfactura, fecha, vcliente, vvendedor, 0.16);
    SET vitems = f_aleatorio(1, maxitems);
    WHILE vcontador <= vitems
    DO
		SET vproducto = f_producto_aleatorio();
        /* Verifica que un mismo número de factura
        y un mismo número de producto no aparezcan en la misma venta
        para evitar duplicación de claves en items */
        SELECT COUNT(*) INTO vnumitems FROM items
        WHERE CODIGO = vproducto AND NUMERO = vnfactura;
        IF vnumitems = 0 THEN
			SET vcantidad = f_aleatorio(1, maxcant);
			SELECT precio INTO vprecio FROM productos WHERE CODIGO = vproducto;
			INSERT INTO items(NUMERO, CODIGO, CANTIDAD, PRECIO) VALUES(            
			vnfactura, vproducto, vcantidad, vprecio);
		END IF;
        SET vcontador = vcontador + 1;
    END WHILE;
END $$


CALL sp_venta('20240619', 20, 50);


/*
En la tabla de facturas tenemos el valor del impuesto. En la tabla de ítems tenemos la cantidad y la facturación.
Calcula el valor del impuesto pago en el año de 2015 redondeando al mayor entero.
*/

SELECT * FROM facturas
WHERE YEAR(FECHA) = 2015;
SELECT * FROM items;

SELECT YEAR(F.FECHA) AS AÑO, CEILING(SUM((I.CANTIDAD * I.PRECIO) * F.IMPUESTO)) AS VALOR
FROM items I
INNER JOIN
facturas F
ON I.NUMERO = F.NUMERO
WHERE YEAR(F.FECHA) = 2015
GROUP BY AÑO;
SELECT f_cliente_aleatorio() AS CLIENTE,
f_producto_aleatorio() AS PRODUCTO,
f_vendedor_aleatorio() AS VENDEDOR;

SELECT NUMERO FROM facturas;
SELECT MAX(NUMERO) + 1 FROM facturas;
SELECT COUNT(*) FROM facturas;
SELECT NUMERO FROM FACTURAS ORDER BY NUMERO DESC LIMIT 88000;
/* El número de factura es un VARCHAR, se necesita convertirlo a INT */
/* Para corregir el error vuelve a crear las tablas FACTURAS e ITEMS con INT en sus PK */

DROP TABLE vendedores;
CREATE TABLE vendedores (
  MATRICULA INT NOT NULL,
  NOMBRE varchar(100) DEFAULT NULL,
  BARRIO varchar(50) DEFAULT NULL,
  COMISION float DEFAULT NULL,
  FECHA_ADMISION date DEFAULT NULL,
  VACACIONES bit(1) DEFAULT NULL,
  PRIMARY KEY (MATRICULA)
);

DROP TABLE facturas;
CREATE TABLE facturas(
NUMERO INT NOT NULL,
FECHA DATE,
DNI VARCHAR(11) NOT NULL,
MATRICULA INT NOT NULL,
IMPUESTO FLOAT,
PRIMARY KEY (NUMERO),
FOREIGN KEY (DNI) REFERENCES clientes(DNI),
FOREIGN KEY (MATRICULA) REFERENCES vendedores(MATRICULA)
);

DROP TABLE items;
CREATE TABLE items(
NUMERO INT NOT NULL,
CODIGO VARCHAR(10) NOT NULL,
CANTIDAD INT,
PRECIO FLOAT,
PRIMARY KEY (NUMERO, CODIGO),
FOREIGN KEY (NUMERO) REFERENCES facturas(NUMERO),
FOREIGN KEY (CODIGO) REFERENCES productos(CODIGO)
);


INSERT VENDEDORES (MATRICULA, NOMBRE, COMISION, FECHA_ADMISION, VACACIONES, BARRIO) VALUES ('00235','Miguel Pavón Silva',0.08,'2014-08-15', 0,'Condesa');
INSERT VENDEDORES (MATRICULA, NOMBRE, COMISION, FECHA_ADMISION, VACACIONES, BARRIO) VALUES ('00236', 'Claudia Morales',0.08,'2013-09-17', 1,'Del Valle');
INSERT VENDEDORES (MATRICULA, NOMBRE, COMISION, FECHA_ADMISION, VACACIONES, BARRIO) VALUES ('00237', 'Concepción Martinez',0.11,'2017-03-18', 1,'Contadero');
INSERT VENDEDORES (MATRICULA, NOMBRE, COMISION, FECHA_ADMISION, VACACIONES, BARRIO) VALUES ('00238', 'Patricia Sánchez',0.11,'2016-08-21', 0,'Oblatos');


/* Casteo el VARCHAR de MATRICULA en UNSIGNED y lo toma como INT */
INSERT INTO facturas
SELECT NUMERO, FECHA_VENTA AS FECHA, DNI, CAST(MATRICULA AS UNSIGNED) AS MATRICULA, IMPUESTO
FROM jugos_ventas.facturas;

INSERT INTO items
SELECT NUMERO, CODIGO_DEL_PRODUCTO AS CODIGO, CANTIDAD, PRECIO
FROM jugos_ventas.items_facturas;


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
        SET vcantidad = f_aleatorio(1, maxcant);
        SELECT precio INTO vprecio FROM productos WHERE CODIGO = vproducto;
        INSERT INTO items(NUMERO, CODIGO, CANTIDAD, PRECIO) VALUES(
        vnfactura, vproducto, vcantidad, vprecio);
        SET vcontador = vcontador + 1;
    END WHILE;
END $$


/* Genero una venta */
CALL sp_venta('20240619', 3, 100);

/* Verificamos que incrementó en uno facturas */
SELECT MAX(NUMERO) + 1 FROM facturas;


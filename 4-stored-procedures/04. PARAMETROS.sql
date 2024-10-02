DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `incluir_producto_parametros`(vcodigo VARCHAR(20), vnombre VARCHAR(20),
vsabor VARCHAR(20), vtamano VARCHAR(20), venvase VARCHAR(20), vprecio DECIMAL(4,2))
BEGIN
DECLARE mensaje VARCHAR(40);
DECLARE EXIT HANDLER FOR 1062
BEGIN
	SET mensaje = 'Producto duplicado!';
    SELECT mensaje;
END;
INSERT INTO tabla_de_productos (CODIGO_DEL_PRODUCTO,NOMBRE_DEL_PRODUCTO,SABOR,TAMANO,ENVASE,PRECIO_DE_LISTA)
     VALUES (vcodigo,vnombre,vsabor,vtamano,venvase,vprecio);
SET mensaje = 'Producto incluido con éxito!';
SELECT mensaje;
END $$


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualiza_comision_vendedores`(porcentaje_actualizado float)
BEGIN
UPDATE tabla_de_vendedores SET porcentaje_comision = porcentaje_comision * (1 + porcentaje_actualizado);
END $$


CALL incluir_producto_parametros('1000800', 'Sabor del Mar', '700 ml', 'Naranja', 'Botella de Vidrio', 2.25);

SELECT * FROM tabla_de_productos WHERE codigo_del_producto = '1000800';

SELECT * FROM tabla_de_vendedores;

CALL actualiza_comision_vendedores(0.9);
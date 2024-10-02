SELECT * FROM tb_vendedor;

SELECT * FROM jugos_ventas.tabla_de_vendedores;

SELECT * FROM tb_vendedor A
INNER JOIN
jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = SUBSTRING(B.MATRICULA, 3, 3);

UPDATE tb_vendedor A
INNER JOIN
jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = SUBSTRING(B.MATRICULA, 3, 3)
SET A.DE_VACACIONES = B.VACACIONES;

/* 
Podemos observar que los vendedores se encuentran en barrios asociados a ellos.
Vamos a aumentar en 30% el volumen de compra de los clientes que tienen, en sus direcciones,
barrios donde los vendedores cuentan con oficinas.
 */
 
SELECT A.DNI, A.VOLUMEN_COMPRA FROM tb_cliente A
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO; 

UPDATE tb_cliente A
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO
SET A.VOLUMEN_COMPRA = A.VOLUMEN_COMPRA * 1.3;



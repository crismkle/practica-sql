
CREATE DATABASE jugos_ventas;

# Se importa los datos jugos_ventas de la carpeta dump

# Para las tablas facturas e items copia los datos de la BD jugos_ventas

INSERT INTO facturas
SELECT NUMERO, FECHA_VENTA AS FECHA, DNI, MATRICULA, IMPUESTO
FROM jugos_ventas.facturas;

INSERT INTO items
SELECT NUMERO, CODIGO_DEL_PRODUCTO AS CODIGO, CANTIDAD, PRECIO
FROM jugos_ventas.items_facturas;



SELECT * FROM facturas f
INNER JOIN
items i
ON f.NUMERO = i.NUMERO;


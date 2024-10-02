SELECT * FROM tabla_de_vendedores;

SELECT * FROM facturas;

SELECT * FROM tabla_de_vendedores A
INNER JOIN
facturas B
ON A.MATRICULA = B.MATRICULA;

SELECT A.NOMBRE, B.MATRICULA, COUNT(*) FROM tabla_de_vendedores A
INNER JOIN
facturas B
ON A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, B.MATRICULA;

SELECT A.NOMBRE, B.MATRICULA, COUNT(*)
FROM tabla_de_vendedores A, facturas B
WHERE A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, B.MATRICULA;


# Obtén la facturación anual de la empresa.
# Ten en cuenta que el valor financiero de las ventas consiste en multiplicar la cantidad por el precio.

select * from facturas;
select * from items_facturas;

SELECT YEAR(FECHA_VENTA), SUM(B.PRECIO*B.CANTIDAD) AS FACTURACION FROM facturas A
INNER JOIN
items_facturas B
ON A.NUMERO = B.NUMERO
GROUP BY YEAR(FECHA_VENTA);

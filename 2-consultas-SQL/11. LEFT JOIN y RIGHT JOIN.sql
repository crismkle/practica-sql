SELECT COUNT(*) FROM tabla_de_clientes;

# Clientes que han comprado

SELECT DISTINCT A.DNI, A.NOMBRE, B.DNI FROM tabla_de_clientes A
INNER JOIN
facturas B
ON A.DNI = B.DNI;

# Clientes que no han comprado

SELECT DISTINCT A.DNI, A.NOMBRE, A.CIUDAD, B.DNI FROM tabla_de_clientes A
LEFT JOIN
facturas B
ON A.DNI = B.DNI
WHERE B.DNI IS NULL;

SELECT DISTINCT B.DNI, B.NOMBRE, B.CIUDAD, A.DNI FROM facturas A
RIGHT JOIN
tabla_de_clientes B
ON A.DNI = B.DNI
WHERE A.DNI IS NULL;
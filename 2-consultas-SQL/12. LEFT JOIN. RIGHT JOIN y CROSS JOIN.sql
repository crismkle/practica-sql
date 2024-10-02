SELECT COUNT(*) FROM tabla_de_clientes;
SELECT * FROM tabla_de_vendedores;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO,
tabla_de_vendedores.NOMBRE
FROM tabla_de_clientes
INNER JOIN
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO,
tabla_de_vendedores.NOMBRE
FROM tabla_de_clientes
LEFT JOIN
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO,
tabla_de_vendedores.NOMBRE, tabla_de_vendedores.VACACIONES
FROM tabla_de_clientes
RIGHT JOIN
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO,
tabla_de_vendedores.NOMBRE, VACACIONES
FROM tabla_de_clientes
RIGHT JOIN
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

# Para hacer un full join en mysql, se debe hacer un right join y luego un left join (así tira error)

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO,
tabla_de_vendedores.NOMBRE, tabla_de_vendedores.VACACIONES
FROM tabla_de_clientes
FULL JOIN
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

# CROSS JOIN

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO,
tabla_de_vendedores.NOMBRE, tabla_de_vendedores.VACACIONES
FROM tabla_de_clientes, tabla_de_vendedores
WHERE tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;
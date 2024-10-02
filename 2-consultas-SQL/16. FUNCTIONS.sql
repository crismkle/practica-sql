SELECT LTRIM("     MySQL es fácil");

SELECT RTRIM("MySQL es fácil     ");

SELECT TRIM("     MySQL es fácil     ");

SELECT CONCAT("MySQL es fácil", " ¿No lo crees?");

SELECT UPPER("MySQL es una base de datos interesante");

SELECT LOWER("MySQL es una base de datos interesante");

SELECT SUBSTRING("MySQL es una base de datos interesante", 14, 4);

SELECT CONCAT(NOMBRE, " ", DNI) FROM tabla_de_clientes;

# Haz una consulta listando el nombre del cliente y la dirección completa (Con calle, barrio, ciudad y estado).

SELECT NOMBRE, CONCAT(DIRECCION_1, ", ", BARRIO, ", ", CIUDAD, ", ", ESTADO) AS DIRECCION
FROM tabla_de_clientes;
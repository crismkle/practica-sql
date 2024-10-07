-- Con acceso sólo a la base jugos_ventas

CREATE USER 'user04'@'%' IDENTIFIED BY 'user04';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES,
LOCK TABLES, EXECUTE ON jugos_ventas.* TO 'user04'@'%';


-- Con acceso sólo a dos tablas

CREATE USER 'user05'@'%' IDENTIFIED BY 'user05';

GRANT SELECT, INSERT, UPDATE, DELETE ON jugos_ventas.facturas TO 'user05'@'%';

GRANT SELECT ON jugos_ventas.tabla_de_vendedores TO 'user05'@'%';
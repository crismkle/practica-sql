-- Costo 8849.05
SELECT * FROM facturas WHERE FECHA_VENTA = '20170101';

-- Costo 25.90
ALTER TABLE facturas ADD INDEX(FECHA_VENTA);
SELECT * FROM facturas WHERE FECHA_VENTA = '20170101';

-- Costo 8861.55
SELECT * FROM facturas1 WHERE FECHA_VENTA = '20170101';

-- Usando mysqlslap
-- Simulando un número determinado de consultas a la BD
-- utilizando ciertos parámetros, por ej. simulando 100 consultas (concurrency)

-- mysqlslap -uroot -p --concurrency=100 --iterations=10 --create-schema=jugos_ventas -- query= "SELECT * FROM facturas WHERE FECHA_VENTA = '20170101'";
/*
Benchmark
        Average number of seconds to run all queries: 0.384 seconds
        Minimum number of seconds to run all queries: 0.079 seconds
        Maximum number of seconds to run all queries: 1.110 seconds
        Number of clients running queries: 100
        Average number of queries per client: 0
*/

-- Ahora usando una consulta sin índices (si PK)

-- mysqlslap -uroot -p --concurrency=100 --iterations=10 --create-schema=jugos_ventas -- query= "SELECT * FROM facturas1 WHERE FECHA_VENTA = '20170101'";
/*
Benchmark
        Average number of seconds to run all queries: 0.690 seconds
        Minimum number of seconds to run all queries: 0.046 seconds
        Maximum number of seconds to run all queries: 1.750 seconds
        Number of clients running queries: 100
        Average number of queries per client: 0
*/

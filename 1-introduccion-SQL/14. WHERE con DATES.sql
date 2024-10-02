select * from tbcliente;

select * from tbcliente where FECHA_NACIMIENTO = '1995-01-13';

select * from tbcliente where FECHA_NACIMIENTO < '1995-01-13';

select * from tbcliente where FECHA_NACIMIENTO >= '1995-01-13';

select * from tbcliente where YEAR(FECHA_NACIMIENTO) = 1995;

select * from tbcliente where day(FECHA_NACIMIENTO) = 20;

select * from tabla_de_vendedores where year(FECHA_ADMISION) >= 2016;
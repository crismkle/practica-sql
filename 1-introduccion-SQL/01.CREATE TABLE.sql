USE jugos;
create table TBCLIENTES(
DNI varchar(20),
NOMBRE varchar(150),
DIRECCION1 varchar(150),
DIRECCION2 varchar(150),
BARRIO varchar(50),
CIUDAD varchar(50),
ESTADO varchar(50),
CP varchar(10),
EDAD smallint,
SEXO varchar(1),
LIMITE_CREDITO float,
VOLUMEN_COMPRA float,
PRIMERA_COMPRA bit(1)
);

create table TABLA_DE_VENDEDORES(
MATRICULA varchar(5),
NOMBRE varchar(100),
PORCENTAJE_COMISION float);

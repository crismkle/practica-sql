alter table tbclientes add primary key(dni);

alter table tbclientes add column(fecha_nacimiento DATE);

insert into tbclientes (DNI, NOMBRE, DIRECCION1, DIRECCION2, BARRIO, CIUDAD, ESTADO, CP, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA, FECHA_NACIMIENTO)
VALUES ('5645642', 'Pedro', 'Calle del sol', '', 'Los laureles', 'CMX', 'Mexico', '3423', 55, 'M', 100000, 2000, 0, '1971-05-25');

select * from tbclientes;
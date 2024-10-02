delete from tabla_de_vendedores;

alter table tabla_de_vendedores add column(FECHA_ADMISION date, DE_VACACIONES bit(1));

alter table tabla_de_vendedores add primary key(matricula);

insert into tabla_de_vendedores (matricula, nombre, porcentaje_comision, FECHA_ADMISION, DE_VACACIONES)
values ('00235', 'Márcio Almeida Silva', 0.08, '2014-08-15', 0),
		('00236', 'Cláudia Morais', 0.08, '2013-09-17', 1),
        ('00237', 'Roberta Martins', 0.11, '2017-03-18', 1),
        ('00238', 'Péricles Alves', 0.11, '2016-08-21', 0);
        
select * from tabla_de_vendedores;
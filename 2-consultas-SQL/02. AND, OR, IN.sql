select * from tabla_de_productos;

select * from tabla_de_productos where sabor = 'mango' and tamano = '470 ml';

select * from tabla_de_productos where sabor = 'mango' or tamano = '470 ml';

select * from tabla_de_productos where not (sabor = 'mango') or tamano = '470 ml';

select * from tabla_de_productos where not (sabor = 'mango' and tamano = '470 ml');

select * from tabla_de_productos where sabor = 'mango' and not (tamano = '470 ml');

select * from tabla_de_productos where sabor in ('mango', 'uva');

select * from tabla_de_clientes where ciudad in ('ciudad de méxico', 'guadalajara');

select * from tabla_de_clientes where ciudad in ('ciudad de méxico', 'guadalajara') and edad > 21;

select * from tabla_de_clientes where ciudad in ('ciudad de méxico', 'guadalajara') and (edad between 20 and 25);
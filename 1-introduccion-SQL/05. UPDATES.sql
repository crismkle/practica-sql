update tbproductos set producto = '812828', envase = 'latita'
where volumen = '350 ml';

update tbproductos set precio = 28.51
where producto = '695594';

update tbproductos set sabor = 'lima/limón', precio = 4.90
where producto = '1041119';

select * from tbproductos;

update tabla_de_vendedores set porcentaje_comision = 0.11
where matricula = '00236';

update tabla_de_vendedores set nombre = 'Joan Geraldo de la Fonseca Junior'
where matricula = '00233';

select * from tabla_de_vendedores;
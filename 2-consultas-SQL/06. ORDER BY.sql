
select * from tabla_de_productos;

select * from tabla_de_productos order by PRECIO_DE_LISTA;

select * from tabla_de_productos order by PRECIO_DE_LISTA desc;

select * from tabla_de_productos order by NOMBRE_DEL_PRODUCTO;

select * from tabla_de_productos order by NOMBRE_DEL_PRODUCTO desc;

select * from tabla_de_productos order by envase desc, NOMBRE_DEL_PRODUCTO asc;

select * from tabla_de_productos;

select * from tabla_de_productos where NOMBRE_DEL_PRODUCTO = 'Refrescante' and tamano = '1 Litro' and sabor = 'Frutilla/Limón';
select * from items_facturas where CODIGO_DEL_PRODUCTO = "1101035" order by CANTIDAD desc;

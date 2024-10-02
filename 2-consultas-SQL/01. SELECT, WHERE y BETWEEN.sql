use jugos_ventas;

select * from facturas;

select nombre, direccion_1, direccion_2, barrio, ciudad, estado, cp from tabla_de_clientes;

select * from tabla_de_clientes;

select dni, nombre from tabla_de_clientes;

select dni as identificacion, nombre as cliente from tabla_de_clientes;

select * from tabla_de_productos;

select * from tabla_de_productos where sabor = 'Uva';

select * from tabla_de_productos where sabor = 'Mango';

select * from tabla_de_productos where envase = 'Botella PET';

select * from tabla_de_productos where precio_de_lista > 16;

select * from tabla_de_productos where precio_de_lista <= 17;

select * from tabla_de_productos where precio_de_lista between 16 and 16.02;
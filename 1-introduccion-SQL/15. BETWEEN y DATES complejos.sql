select * from tbproducto;

select * from tbproducto where precio_lista between 28.49 and 28.52;

select * from tbproducto where precio_lista >= 28.49 and PRECIO_LISTA <= 28.52;

select * from tbproducto where envase = 'Lata' or envase = 'Botella PET';

select * from tbproducto where (precio_lista >= 15 and PRECIO_LISTA <= 25) or (envase = 'Lata' or envase = 'Botella PET');

select * from tabla_de_vendedores where DE_VACACIONES = 1 and year(fecha_admision) < 2016;

select nombre, matricula from tabla_de_vendedores;

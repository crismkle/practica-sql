
select * from tabla_de_clientes;

select estado, limite_de_credito from tabla_de_clientes;

select estado, sum(limite_de_credito) as limite_total from tabla_de_clientes group by estado;

select envase, precio_de_lista from tabla_de_productos;

select envase, max(precio_de_lista) as mayor_precio from tabla_de_productos group by envase;

select envase, count(*) as cantidad from tabla_de_productos group by envase;

select barrio, sum(limite_de_credito) as limite from tabla_de_clientes group by barrio;

select ciudad, barrio, sum(limite_de_credito) as limite from tabla_de_clientes where ciudad = 'ciudad de méxico' group by barrio;

select estado, barrio, max(limite_de_credito) as limite from tabla_de_clientes group by estado, barrio;

select estado, barrio, max(limite_de_credito) as limite,
edad from tabla_de_clientes
where edad >= 20
group by estado, barrio, edad
order by edad;

# ¿Cuántos ítems vendidos cuentan con la mayor cantidad del producto '1101035'?

select * from items_facturas;

select max(cantidad) as cantidad_máxima from items_facturas where CODIGO_DEL_PRODUCTO = 1101035;

select count(cantidad) as cantidad_máxima from items_facturas where CODIGO_DEL_PRODUCTO = 1101035 and cantidad = 99;
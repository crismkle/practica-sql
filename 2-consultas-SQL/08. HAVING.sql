
select estado, sum(limite_de_credito) as limite_total from tabla_de_clientes group by estado;

select estado, sum(limite_de_credito) as limite_total from tabla_de_clientes group by estado having limite_total > 300000;

select envase, max(precio_de_lista) as precio_maximo, min(precio_de_lista) as precio_minimo
from tabla_de_productos group by envase;

select envase, max(precio_de_lista) as precio_maximo, min(precio_de_lista) as precio_minimo,
sum(precio_de_lista) as suma_precio
from tabla_de_productos group by envase having sum(precio_de_lista) > 80;

select envase, max(precio_de_lista) as precio_maximo, min(precio_de_lista) as precio_minimo,
sum(precio_de_lista) as suma_precio
from tabla_de_productos group by envase having sum(precio_de_lista) >= 80 and max(PRECIO_DE_LISTA) >= 5;

# ¿Quiénes fueron los clientes que realizaron más de 2000 compras en 2016?

select dni, count(*) as compras from facturas
where year(FECHA_VENTA) = 2016
group by dni
having compras > 2000;
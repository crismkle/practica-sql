select * from tabla_de_productos;

select nombre_del_producto, precio_de_lista,
CASE
	WHEN precio_de_lista >= 12 THEN 'Costoso'
    WHEN precio_de_lista >= 5 AND PRECIO_DE_LISTA <= 12 THEN 'Asequible'
    ELSE 'Barato'
END AS precio
FROM tabla_de_productos;

select envase, ANY_VALUE(SABOR) as sabor,
CASE
	WHEN precio_de_lista >= 12 THEN 'Costoso'
    WHEN precio_de_lista >= 5 AND PRECIO_DE_LISTA <= 12 THEN 'Asequible'
    ELSE 'Barato'
END AS precio, min(PRECIO_DE_LISTA) as precio_minimo
FROM tabla_de_productos
where tamano = '700 ml'
group by envase,
CASE
	WHEN precio_de_lista >= 12 THEN 'Costoso'
    WHEN precio_de_lista >= 5 AND PRECIO_DE_LISTA <= 12 THEN 'Asequible'
    ELSE 'Barato'
END
order by envase;


# Registre el año de nacimiento de los clientes y clasifíquelos de la siguiente manera:
# Nacidos antes de 1990= Viejos, nacidos entre 1990 y 1995= Jóvenes y nacidos después de 1995= Niños.
# Liste el nombre del cliente y esta clasificación.

SELECT nombre, FECHA_DE_NACIMIENTO,
CASE
	WHEN year(FECHA_DE_NACIMIENTO) < 1990 THEN 'Viejos'
    WHEN year(FECHA_DE_NACIMIENTO) >= 1990 AND year(FECHA_DE_NACIMIENTO) <= 1995 THEN 'Jóvenes'
    ELSE 'Niños'
END AS Clasificación
FROM tabla_de_clientes;

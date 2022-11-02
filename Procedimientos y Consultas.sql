USE bd_juego_g9


--SELECT * FROM tiendas

--SELECT t.nombre as 'Nombre Tienda',i.nombre as 'Articulo',c.titulo_categoria as 'Categoria',ti.precio,ti.cantidad
--FROM tiendas_items ti
--INNER JOIN items i
--ON ti.id_item = i.id_item
--INNER JOIN tiendas t 
--ON ti.id_tienda = t.id_tienda
--INNER JOIN categorias c
--ON i.id_categoria = c.id_categoria
----WHERE t.id_tienda = 1

--ALTER VIEW Tiendas
--AS 
--SELECT * , COUNT(*) [libre]
--FROM tiendas_items ti
--INNER JOIN items i
--ON ti.id_item = i.id_item
--INNER JOIN tiendas t 
--ON ti.id_tienda = t.id_tienda
--INNER JOIN categorias c
--ON i.id_categoria = c.id_categoria
----WHERE t.id_tienda = 1

--SELECT *
--FROM tiendas_items ti
--INNER JOIN tiendas t
--ON ti.id_tienda = t.id_tienda
--WHERE t.id_tienda = 1

--SELECT *, 
--	(SELECT COUNT(*)
--	FROM tiendas_items ti
--	INNER JOIN tiendas t
--	ON ti.id_tienda = t.id_tienda
--	WHERE ti.id_tienda = 1) as [Slots Restantes]
--FROM tiendas
----where id_tienda = 1

--SELECT * 
--FROM tiendas_items ti
--INNER JOIN tiendas t
--ON ti.id_tienda = t.id_tienda
	


--SELECT COUNT(*)
--FROM tiendas_items ti
--INNER JOIN tiendas t
--ON ti.id_tienda = t.id_tienda
--WHERE t.id_tienda = 1
--GO


ALTER VIEW ArticulosEnTiendas
AS 
SELECT t.id_tienda as 'idTienda', t.cant_slots as 'Slots', t.nombre as 'Nombre Tienda',i.nombre as 'Articulo',c.titulo_categoria as 'Categoria',ti.precio,ti.cantidad
FROM tiendas_items ti
INNER JOIN items i
ON ti.id_item = i.id_item
INNER JOIN tiendas t 
ON ti.id_tienda = t.id_tienda
INNER JOIN categorias c
ON i.id_categoria = c.id_categoria
--WHERE t.id_tienda = 1
GO 

--SELECT * FROM ArticulosEnTiendas
--WHERE ArticulosEnTiendas.idTienda = 3

--SELECT COUNT(*) FROM ArticulosEnTiendas
--WHERE ArticulosEnTiendas.idTienda = 1

----DROP FUNCTION F_ComprobarSlots
--go

ALTER FUNCTION ComprobarSlots(@Idt as int)
RETURNS int
AS 
BEGIN
   DECLARE @retval int
   SELECT @retval = (SELECT cant_slots FROM tiendas where id_tienda = @Idt) - (SELECT COUNT(*) FROM ArticulosEnTiendas WHERE ArticulosEnTiendas.idTienda = @Idt)
   RETURN @retval
END;
GO

--SELECT COUNT(*) FROM ArticulosEnTiendas WHERE ArticulosEnTiendas.idTienda = 1
--SELECT Slots FROM ArticulosEnTiendas WHERE ArticulosEnTiendas.idTienda =  1
--SELECT cant_slots FROM tiendas where id_tienda = 1

--SELECT (SELECT cant_slots FROM tiendas where id_tienda = 3) - (SELECT COUNT(*) FROM ArticulosEnTiendas WHERE ArticulosEnTiendas.idTienda = 3) AS Libre


--SELECT cant_slots FROM tiendas

--INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (3,3,600,1);
--INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (3,4,200,2);
--INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (3,5,300,1);

--delete from tiendas_items
-- where id_tienda = 3

--SELECT * FROM ArticulosEnTiendas

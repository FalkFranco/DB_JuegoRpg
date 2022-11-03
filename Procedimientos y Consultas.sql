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

SELECT * FROM ArticulosEnTiendas
select * from tiendas


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

SELECT COUNT(*) FROM ArticulosEnTiendas WHERE ArticulosEnTiendas.idTienda = 1
--SELECT Slots FROM ArticulosEnTiendas WHERE ArticulosEnTiendas.idTienda =  1
SELECT cant_slots FROM tiendas where id_tienda = 1

--SELECT (SELECT cant_slots FROM tiendas where id_tienda = 3) - (SELECT COUNT(*) FROM ArticulosEnTiendas WHERE ArticulosEnTiendas.idTienda = 3) AS Libre


--SELECT cant_slots FROM tiendas

--INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (3,3,600,1);
--INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (3,4,200,2);
--INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (3,5,300,1);

--delete from tiendas_items
-- where id_tienda = 3

--SELECT * FROM ArticulosEnTiendas



--VISTAS
--Vista personajes en una cuenta

SELECT * 
FROM personajes pe
INNER JOIN cuentas cu
ON pe.id_usuario = cu.id_usuario

GO
CREATE VIEW CuentaPersonajes
AS 
SELECT pe.id_usuario, pe.id_personaje, pe.nombre_personaje, cl.nombre_clase as 'Clase'
FROM personajes pe
INNER JOIN clases cl
ON pe.id_clase = cl.id_clase
GO


CREATE VIEW CuentaPersonajesDetalles
AS
SELECT pe.id_usuario, pe.id_personaje,cp.nombre_personaje,cp.Clase,es.nivel,es.experiencia,pe.oro,pe.mana,es.vida,es.fuerza,es.agilidad,es.magia
FROM personaje_estadistica pe
INNER JOIN estadisticas es
ON pe.id_estadistica = es.id_estadistica
INNER JOIN CuentaPersonajes cp 
ON pe.id_personaje = cp.id_personaje
GO

SELECT * FROM personajes

select * from CuentaPersonajes
select * from CuentaPersonajesDetalles
go

CREATE TRIGGER InstanciarEstadisticas
ON personajes FOR INSERT AS
BEGIN 
	DECLARE @idUsuario INT
	DECLARE @IdPersonaje INT
	DECLARE @idClase int
	DECLARE @IdEstadistica INT
	SELECT @idUsuario = INSERTED.id_usuario
	FROM INSERTED
	SELECT @IdPersonaje = INSERTED.id_personaje
	FROM INSERTED

	--Instanciar una estadistica
	IF (SELECT INSERTED.id_clase from INSERTED) = 1
		INSERT INTO estadisticas(vida,nivel,experiencia,fuerza,agilidad,magia) VALUES (100,0,0,50,100,0);
	ELSE IF (SELECT INSERTED.id_clase from INSERTED) = 2
		INSERT INTO estadisticas(vida,nivel,experiencia,fuerza,agilidad,magia) VALUES (100,0,0,100,50,0);
	ELSE IF (SELECT INSERTED.id_clase from INSERTED) = 3
		INSERT INTO estadisticas(vida,nivel,experiencia,fuerza,agilidad,magia) VALUES (100,0,0,50,100,0);
		
	SELECT @IdEstadistica = id_estadistica FROM estadisticas WHERE id_estadistica=(SELECT max(id_estadistica) FROM estadisticas);
	--Instaciar personaje_estadistica

	INSERT INTO personaje_estadistica(id_usuario,id_personaje,id_estadistica,oro,mana) VALUES (@idUsuario,@IdPersonaje,@IdEstadistica,100,100);
END
GO

SELECT * FROM personajes

IF (SELECT id_estadistica FROM estadisticas WHERE id_estadistica=(SELECT max(id_estadistica) FROM estadisticas)) = 3
	SELECT 'OK'


SELECT * FROM estadisticas WHERE id_estadistica=(SELECT max(id_estadistica) FROM estadisticas);
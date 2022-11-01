USE bd_juego_g9

INSERT INTO tiendas(nombre,cant_slots) VALUES ('Tienda1',10);
INSERT INTO tiendas(nombre,cant_slots) VALUES ('Tienda2',10);

INSERT INTO inventarios(cant_slots) VALUES (10);
INSERT INTO inventarios(cant_slots) VALUES (12);


INSERT INTO cuentas(nombre_usuario,contra,ip_usuario) VALUES ('user1','pass123','192.168.0.1');
INSERT INTO cuentas(nombre_usuario,contra,ip_usuario) VALUES ('user2','pass123','192.168.0.2');
INSERT INTO cuentas(nombre_usuario,contra,ip_usuario) VALUES ('user3','pass123','192.168.0.3');
INSERT INTO cuentas(nombre_usuario,contra,ip_usuario) VALUES ('user4','pass123','192.168.0.4');

INSERT INTO mapas(nombre_mapa,tamanio_x,tamanio_y) VALUES ('Inicio', 1080, 1080);
INSERT INTO mapas(nombre_mapa,tamanio_x,tamanio_y) VALUES ('Final', 1080, 1080);

INSERT INTO clases(nombre_clase,descripcion) VALUES ('Mago','Descripcion Mago...');
INSERT INTO clases(nombre_clase,descripcion) VALUES ('Guerrero','Descripcion Guerrero...');
INSERT INTO clases(nombre_clase,descripcion) VALUES ('Arquero','Descripcion Arquero...');

INSERT INTO npcs_tipos(nombre_tipo) VALUES ('Aldeano');
INSERT INTO npcs_tipos(nombre_tipo) VALUES ('Informados');
INSERT INTO npcs_tipos(nombre_tipo) VALUES ('Boss');

INSERT INTO npcs(id_tipo,nombre_npc,estatico) VALUES (1,'Juan', 1)
INSERT INTO npcs(id_tipo,nombre_npc,estatico) VALUES (2,'Elena', 1)
INSERT INTO npcs(id_tipo,nombre_npc,estatico) VALUES (1,'Eduardo', 1)
INSERT INTO npcs(id_tipo,nombre_npc,estatico) VALUES (1,'Spider', 1)

INSERT INTO categorias(titulo_categoria,descripcion) VALUES ('Espada','Descripcion Espada...');
INSERT INTO categorias(titulo_categoria,descripcion) VALUES ('Escudo','Descripcion Escudo...');
INSERT INTO categorias(titulo_categoria,descripcion) VALUES ('Arco','Descripcion Arco...');
INSERT INTO categorias(titulo_categoria,descripcion) VALUES ('Flechas','Descripcion Flechas...');

INSERT INTO items(id_categoria,nombre,descripcion) VALUES (1, 'Espada de Plata', 'Descripcion Espada de Plata');
INSERT INTO items(id_categoria,nombre,descripcion) VALUES (1, 'Espada de Oro', 'Descripcion Espada de Oro');
INSERT INTO items(id_categoria,nombre,descripcion) VALUES (1, 'Espada de Diamante', 'Descripcion Espada de Diamante');
INSERT INTO items(id_categoria,nombre,descripcion) VALUES (2, 'Escudo de Plata', 'Descripcion Escudo de Plata');
INSERT INTO items(id_categoria,nombre,descripcion) VALUES (3, 'Arco Echizado', 'Descripcion Arco Echizado');

INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (1,1,132,3);
INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (1,2,200,2);
INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (1,3,500,2);
INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (1,4,253,2);
INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (1,5,330,1);

INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (2,3,600,1);
INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (2,4,200,2);
INSERT INTO tiendas_items(id_tienda,id_item,precio,cantidad) VALUES (2,5,300,1);

INSERT INTO mapas_npcs(id_mapa,id_npc,coord_x,coord_y) VALUES (1,1,500,500);
INSERT INTO mapas_npcs(id_mapa,id_npc,coord_x,coord_y) VALUES (1,2,300,520);
INSERT INTO mapas_npcs(id_mapa,id_npc,coord_x,coord_y) VALUES (1,3,700,740);
INSERT INTO mapas_npcs(id_mapa,id_npc,coord_x,coord_y) VALUES (1,4,1000,700);

INSERT INTO inventarios_items(id_inventario,id_item,slot,cantidad) VALUES(1,1,1,1);
INSERT INTO inventarios_items(id_inventario,id_item,slot,cantidad) VALUES(1,2,2,1);

INSERT INTO inventarios_items(id_inventario,id_item,slot,cantidad) VALUES(2,2,1,1);
INSERT INTO inventarios_items(id_inventario,id_item,slot,cantidad) VALUES(2,3,2,1);
INSERT INTO inventarios_items(id_inventario,id_item,slot,cantidad) VALUES(2,4,3,2);

INSERT INTO personajes(id_usuario,nombre_personaje,id_clase,id_inventario) VALUES (1,'PersonajeMago',1,1);
INSERT INTO personajes(id_usuario,nombre_personaje,id_clase,id_inventario) VALUES (1,'PersonajeGuerrero',2,2);

INSERT INTO mapas_personajes(id_usuario,id_personaje,id_mapa, coord_x, coord_y) VALUES (1,1,1,100,100);

--Estadisticas Personajes
INSERT INTO estadisticas(vida,nivel,experiencia,fuerza,agilidad,magia) VALUES (100,3,240,50,70,100);
INSERT INTO estadisticas(vida,nivel,experiencia,fuerza,agilidad,magia) VALUES (100,0,0,100,100,25);
--Estadisticas Npc boss
INSERT INTO estadisticas(vida,nivel,experiencia,fuerza,agilidad,magia) VALUES (1000,35,3400,200,300,200);

INSERT INTO estadisticas_item(fuerza,agilidad,magia,req_fuerza,req_agilidad,req_magia,req_clase,req_nivel,poder_defensa,poder_ataque,poder_magico) VALUES (100,20,0,200,50,0,2,1,0,100,0); --'Espada de Plata'
INSERT INTO estadisticas_item(fuerza,agilidad,magia,req_fuerza,req_agilidad,req_magia,req_clase,req_nivel,poder_defensa,poder_ataque,poder_magico) VALUES (200,30,0,300,80,0,2,10,0,150,0); --'Espada de Oro'
INSERT INTO estadisticas_item(fuerza,agilidad,magia,req_fuerza,req_agilidad,req_magia,req_clase,req_nivel,poder_defensa,poder_ataque,poder_magico) VALUES (300,40,0,400,100,0,2,20,0,200,0); --'Espada de Diamante'
INSERT INTO estadisticas_item(fuerza,agilidad,magia,req_fuerza,req_agilidad,req_magia,req_clase,req_nivel,poder_defensa,poder_ataque,poder_magico) VALUES (100,20,0,200,50,50,2,2,100,0,0); --'Escudo de Plata'
INSERT INTO estadisticas_item(fuerza,agilidad,magia,req_fuerza,req_agilidad,req_magia,req_clase,req_nivel,poder_defensa,poder_ataque,poder_magico) VALUES (100,20,0,200,50,0,2,0,5,50,100); --'Arco Echizado'

INSERT INTO personaje_estadistica(id_usuario,id_personaje,id_estadistica,oro,mana) VALUES (1,1,1,300,150);
INSERT INTO personaje_estadistica(id_usuario,id_personaje,id_estadistica,oro,mana) VALUES (1,2,1,100,100);


INSERT INTO npcs_estadistica(id_npc,id_estadistica) VALUES  (4,3)

INSERT INTO items_estadistica_item(id_item,id_estadistica_item) VALUES (1,1)
INSERT INTO items_estadistica_item(id_item,id_estadistica_item) VALUES (2,2)
INSERT INTO items_estadistica_item(id_item,id_estadistica_item) VALUES (3,3)
INSERT INTO items_estadistica_item(id_item,id_estadistica_item) VALUES (4,4)
INSERT INTO items_estadistica_item(id_item,id_estadistica_item) VALUES (5,5)

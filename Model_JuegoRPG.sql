--CREATE DATABASE bd_juego_g9
--DROP DATABASE bd_juego_g9

--USE bd_juego_g9


CREATE TABLE tiendas
(
  id_tienda INT IDENTITY NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  cant_slots INT NOT NULL,
  CONSTRAINT PK_tiendas PRIMARY KEY (id_tienda)
);

CREATE TABLE categorias
(
  id_categoria INT IDENTITY NOT NULL,
  titulo_categoria VARCHAR(100) NOT NULL,
  descripcion VARCHAR(100),
  CONSTRAINT PK_categorias PRIMARY KEY (id_categoria)
);

CREATE TABLE inventarios
(
  id_inventario INT IDENTITY NOT NULL,
  cant_slots INT NOT NULL,
  CONSTRAINT PK_inventarios PRIMARY KEY (id_inventario)
);

CREATE TABLE cuentas
(
  id_usuario int IDENTITY NOT NULL,
  nombre_usuario VARCHAR(100) NOT NULL,
  contra VARCHAR(100) NOT NULL,
  ip_usuario VARCHAR(100) NOT NULL,
  CONSTRAINT PK_cuentas PRIMARY KEY (id_usuario),
  CONSTRAINT UQ_nombre_usuario UNIQUE (nombre_usuario)
);

CREATE TABLE mapas
(
  id_mapa INT IDENTITY NOT NULL,
  nombre_mapa VARCHAR(100) NOT NULL,
  tamanio_x INT NOT NULL,
  tamanio_y INT NOT NULL,
  CONSTRAINT PK_mapas PRIMARY KEY (id_mapa)
);


CREATE TABLE npcs_tipos
(
  id_tipo INT IDENTITY NOT NULL,
  nombre_tipo VARCHAR(100) NOT NULL,
  CONSTRAINT PK_npcs_tipo PRIMARY KEY (id_tipo)
);

CREATE TABLE clases
(
  id_clase INT IDENTITY NOT NULL,
  nombre_clase VARCHAR(100),
  descripcion VARCHAR(100),
  CONSTRAINT PK_clases PRIMARY KEY (id_clase)
);

CREATE TABLE npcs
(
  id_npc INT IDENTITY NOT NULL,
  id_tipo INT NOT NULL,
  nombre_npc VARCHAR(100) NOT NULL,
  estatico BIT NOT NULL,
  CONSTRAINT PK_npcs PRIMARY KEY (id_npc),
  CONSTRAINT FK_npcs_tipos FOREIGN KEY (id_tipo) REFERENCES npcs_tipos(id_tipo)
);

CREATE TABLE items
(
  id_item INT IDENTITY NOT NULL,
  id_categoria INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(100),
  CONSTRAINT PK_items PRIMARY KEY (id_item),
  CONSTRAINT FK_items_categorias FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);


CREATE TABLE tiendas_items
(
  id_tienda INT NOT NULL,
  id_item INT NOT NULL,
  precio FLOAT NOT NULL,
  cantidad INT NOT NULL,
  CONSTRAINT PK_tiendas_items PRIMARY KEY (id_tienda, id_item),
  CONSTRAINT FK_tiendas_items_tiendas FOREIGN KEY (id_tienda) REFERENCES tiendas(id_tienda),
  CONSTRAINT FK_tiendas_items_items FOREIGN KEY (id_item) REFERENCES items(id_item)
);

CREATE TABLE mapas_npcs
(
  id_mapa INT NOT NULL,
  id_npc INT NOT NULL,
  coord_x INT NOT NULL,
  coord_y INT NOT NULL,
  CONSTRAINT PK_mapas_npcs PRIMARY KEY (id_mapa, id_npc),
  CONSTRAINT FK_mapas_npcs_mapas FOREIGN KEY (id_mapa) REFERENCES mapas(id_mapa),
  CONSTRAINT FK_mapas_npcs_npcs FOREIGN KEY (id_npc) REFERENCES npcs(id_npc)
);

CREATE TABLE inventarios_items
(
  id_inventario INT NOT NULL,
  id_item INT NOT NULL,
  slot INT NOT NULL,
  cantidad INT NOT NULL,
  CONSTRAINT PK_inventarios_items PRIMARY KEY (id_inventario, id_item),
  CONSTRAINT FK_inventarios_items_inventarios FOREIGN KEY (id_inventario) REFERENCES inventarios(id_inventario),
  CONSTRAINT FK_inventarios_items_items FOREIGN KEY (id_item) REFERENCES items(id_item)
);

CREATE TABLE personajes
(
  id_usuario INT NOT NULL,
  id_personaje INT IDENTITY NOT NULL,
  nombre_personaje VARCHAR(100) NOT NULL,
  id_clase INT NOT NULL,
  id_inventario INT NOT NULL,
  CONSTRAINT PK_personajes PRIMARY KEY (id_usuario, id_personaje),
  CONSTRAINT UQ_nombre_personaje UNIQUE (nombre_personaje),
  CONSTRAINT FK_personajes_cuentas FOREIGN KEY (id_usuario) REFERENCES cuentas(id_usuario),
  CONSTRAINT FK_personajes_clases FOREIGN KEY (id_clase) REFERENCES clases(id_clase),
  CONSTRAINT FK_personajes_inventarios FOREIGN KEY (id_inventario) REFERENCES inventarios(id_inventario)
);

CREATE TABLE mapas_personajes
(
  id_usuario INT NOT NULL,
  id_personaje INT NOT NULL,
  id_mapa INT NOT NULL,
  coord_x INT NOT NULL,
  coord_y INT NOT NULL,
  CONSTRAINT PK_mapas_personajes PRIMARY KEY (id_usuario, id_personaje, id_mapa),
  CONSTRAINT FK_mapas_personajes_usuarios_personajes FOREIGN KEY (id_usuario, id_personaje) REFERENCES personajes(id_usuario, id_personaje),
  CONSTRAINT FK_mapas_personajes_mapas FOREIGN KEY (id_mapa) REFERENCES mapas(id_mapa)
);

CREATE TABLE estadisticas
(
  id_estadistica INT IDENTITY NOT NULL,
  vida float NOT NULL,
  nivel INT NOT NULL,
  experiencia float NOT NULL,
  fuerza INT NOT NULL,
  agilidad INT NOT NULL,
  magia INT NOT NULL,
  CONSTRAINT PK_Estadisticas PRIMARY KEY (id_estadistica),
)

CREATE TABLE estadisticas_item
(
  id_estadistica_item INT IDENTITY NOT NULL,
  fuerza INT NOT NULL,
  agilidad INT NOT NULL,
  magia INT NOT NULL,
  req_fuerza INT NOT NULL,
  req_agilidad INT NOT NULL,
  req_magia INT NOT NULL,
  req_clase INT NOT NULL,
  req_nivel INT NOT NULL,
  poder_defensa FLOAT NOT NULL,
  poder_ataque FLOAT NOT NULL,
  poder_magico FLOAT NOT NULL,
  CONSTRAINT PK_Estadisticas_Item PRIMARY KEY (id_estadistica_item),
)

CREATE TABLE personaje_estadistica
(
	id_usuario INT NOT NULL,
	id_personaje INT NOT NULL,
	id_estadistica INT NOT NULL,
	oro INT NOT NULL,
	mana float NOT NULL,
	CONSTRAINT PK_personaje_estadistica PRIMARY KEY (id_usuario, id_personaje, id_estadistica),
	CONSTRAINT FK_personaje_estadictica_personajes FOREIGN KEY (id_usuario, id_personaje) REFERENCES personajes(id_usuario,id_personaje),
	CONSTRAINT FK_personaje_estadistica_estadisticas FOREIGN KEY (id_estadistica) REFERENCES estadisticas(id_estadistica)
)


CREATE TABLE npcs_estadistica
(
	id_npc INT NOT NULL,
	id_estadistica INT NOT NULL,
	CONSTRAINT PK_npcs_estadistica PRIMARY KEY (id_npc, id_estadistica),
	CONSTRAINT FK_npcs_estadictica_personajes FOREIGN KEY (id_npc) REFERENCES npcs(id_npc),
	CONSTRAINT FK_npcs_estadistica_estadisticas FOREIGN KEY (id_estadistica) REFERENCES estadisticas(id_estadistica)
)

CREATE TABLE items_estadistica_item
(
	id_item INT NOT NULL,
	id_estadistica_item INT NOT NULL,
	CONSTRAINT PK_items_estadistica_item PRIMARY KEY (id_item, id_estadistica_item),
	CONSTRAINT FK_items_estadistica_item FOREIGN KEY (id_item) REFERENCES items(id_item),
	CONSTRAINT FK_items_estadistica_item_estadisticas FOREIGN KEY (id_estadistica_item) REFERENCES estadisticas_item(id_estadistica_item)
)
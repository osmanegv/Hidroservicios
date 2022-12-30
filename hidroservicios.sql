CREATE SCHEMA hidroservicios;

CREATE  TABLE hidroservicios.producto ( 
	id_producto          VARCHAR(50)  NOT NULL     PRIMARY KEY,
	nombre               MEDIUMTEXT  NOT NULL     ,
	descripcion          MEDIUMTEXT       ,
	categoria            MEDIUMTEXT  NOT NULL     ,
	stock                INT UNSIGNED NOT NULL     ,
	costo                INT UNSIGNED NOT NULL     ,
	precio               INT UNSIGNED NOT NULL     ,
	imagen               MEDIUMTEXT  NOT NULL     ,
	bar_code             LONG VARCHAR       ,
	estatus              CHAR(1)  NOT NULL     
 ) engine=InnoDB;

CREATE  TABLE hidroservicios.usuario ( 
	id_usuario           INT UNSIGNED NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	nombre               MEDIUMTEXT  NOT NULL     ,
	email                MEDIUMTEXT  NOT NULL     ,
	password             MEDIUMTEXT  NOT NULL     ,
	estatus              CHAR(1)  NOT NULL     
 ) engine=InnoDB;

CREATE  TABLE hidroservicios.orden ( 
	id_orden             INT UNSIGNED NOT NULL     PRIMARY KEY,
	id_usuario           INT UNSIGNED      ,
	total                INT UNSIGNED NOT NULL     ,
	CONSTRAINT unq_orden_id_usuario UNIQUE ( id_usuario ) 
 ) engine=InnoDB;

CREATE INDEX fk_id_usuario ON hidroservicios.orden ( total );

CREATE  TABLE hidroservicios.detalle_orden ( 
	id_detalles          INT UNSIGNED NOT NULL     PRIMARY KEY,
	id_orden             INT UNSIGNED      ,
	id_producto          VARCHAR(50)       ,
	cantidad             INT UNSIGNED NOT NULL     ,
	total                INT UNSIGNED NOT NULL     ,
	CONSTRAINT unq_detalle_orden_id_orden UNIQUE ( id_orden ) ,
	CONSTRAINT unq_detalle_orden_id_producto UNIQUE ( id_producto ) 
 ) engine=InnoDB;

ALTER TABLE hidroservicios.detalle_orden ADD CONSTRAINT fk_detalle_orden_orden FOREIGN KEY ( id_orden ) REFERENCES hidroservicios.orden( id_orden ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE hidroservicios.detalle_orden ADD CONSTRAINT fk_detalle_orden_producto FOREIGN KEY ( id_producto ) REFERENCES hidroservicios.producto( id_producto ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE hidroservicios.orden ADD CONSTRAINT fk_orden_usuario FOREIGN KEY ( id_usuario ) REFERENCES hidroservicios.usuario( id_usuario ) ON DELETE NO ACTION ON UPDATE NO ACTION;

DROP PROCEDURE InsertarProducto;


CREATE  PROCEDURE `InsertarProducto`(IN nombre varchar(50), IN descripcion varchar(200), categoria varchar(50), IN stock int, IN precio int, IN imagen varchar(100), IN bar_code varchar(100))
BEGIN

     START TRANSACTION;

     INSERT INTO hidroservicios.producto
     VALUES (nombre, descripcion,categoria, stock, precio, imagen, bar_code, "1");

     COMMIT;

END

CREATE  PROCEDURE `ValidateLogin`(IN p_username VARCHAR(50), IN p_password VARCHAR(50))
BEGIN

     START TRANSACTION;

IF NOT EXISTS(SELECT * FROM usuario WHERE email = p_username AND password = p_password) THEN
    SELECT '0';
ELSE
    SELECT '1';
END IF;
  

     COMMIT;

END

CREATE VIEW hidroservicios.listarproductos AS select `p`.`nombre` AS `nombre`,`p`.`descripcion` AS `descripcion`,`p`.`categoria` AS `categoria`,`p`.`imagen` AS `imagen` from `hidroservicios`.`producto` `p` where `p`.`estatus` = '1';

INSERT INTO hidroservicios.producto( id_producto, nombre, descripcion, categoria, stock, costo, precio, imagen, bar_code, estatus ) VALUES ( '1', 'Bombas', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. ', 'Productos', 20, 500, 0, '1.jpg', null, '1');
INSERT INTO hidroservicios.producto( id_producto, nombre, descripcion, categoria, stock, costo, precio, imagen, bar_code, estatus ) VALUES ( '3', 'Tubos', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit.', 'Productos', 10, 200, 0, '7.jpg', null, '1');
INSERT INTO hidroservicios.producto( id_producto, nombre, descripcion, categoria, stock, costo, precio, imagen, bar_code, estatus ) VALUES ( '4', 'Hidronomaticos', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit.', 'Productos', 10, 200, 0, '10.jpg', null, '1');
INSERT INTO hidroservicios.producto( id_producto, nombre, descripcion, categoria, stock, costo, precio, imagen, bar_code, estatus ) VALUES ( '5', 'Mangueras', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit.', 'Productos', 10, 200, 0, '11.jpg', null, '1');
INSERT INTO hidroservicios.producto( id_producto, nombre, descripcion, categoria, stock, costo, precio, imagen, bar_code, estatus ) VALUES ( '6', 'Duchas', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit.', 'Productos', 10, 200, 0, '1.jpg', null, '1');
INSERT INTO hidroservicios.producto( id_producto, nombre, descripcion, categoria, stock, costo, precio, imagen, bar_code, estatus ) VALUES ( '7', 'Calentador Solar', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit.', 'Productos', 10, 200, 0, '7.jpg', null, '1');
INSERT INTO hidroservicios.producto( id_producto, nombre, descripcion, categoria, stock, costo, precio, imagen, bar_code, estatus ) VALUES ( '8', 'Clorinador Flotante', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit.', 'Productos', 10, 200, 0, '10.jpg', null, '1');
INSERT INTO hidroservicios.usuario( nombre, email, password, estatus ) VALUES ( 'admin', 'admin@mail.com', '12345', '1');

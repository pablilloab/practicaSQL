#Tabla para guardar datos borrados durante 7 dias
CREATE TABLE oyentes_log (
	id_oyentes_log INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id INT NOT NULL,
    nombre VARCHAR(45),
    apellido VARCHAR(45),
    usuario VARCHAR(45),
    password VARCHAR(45)
);

#Tabla para guardar datos borrados durante 7 dias
CREATE TABLE notas_log (
	id_notas_log INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45),
    contenido VARCHAR(200),
    id_categoria INT,
    id_comentario INT
);

#Tabla para guardar el log de todas las modificaciones
CREATE TABLE mod_log (
	id_mod INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(45),
    dia DATETIME,
    hora DATETIME
);

#Trigger que guarda los datos borrados en la tabla de log de oyentes
DELIMITER $$
CREATE TRIGGER tr_oyentes
BEFORE DELETE ON oyentes
	FOR EACH ROW
		INSERT INTO oyentes_log 
		VALUES (NULL, id_oyente, nombre, apellido, usuario, password);
DELIMITER ;

#Trigger que registra el movimiento en la DB
DELIMITER $$
CREATE TRIGGER tr_mod
AFTER DELETE ON oyentes
	FOR EACH ROW
		INSERT INTO mod_log
		VALUES (NULL, user(), current_date(),current_time());
DELIMITER ;

#Trigger que guarda los datos borrados en la tabla de log de notas
DELIMITER $$
CREATE TRIGGER tr_notas
BEFORE DELETE ON notas
	FOR EACH ROW
		INSERT INTO notas_log 
		VALUES (NULL, titulo, contenido, id_categoria, id_comentario);
DELIMITER ;

#Trigger que registra el movimiento en la DB
DELIMITER $$
CREATE TRIGGER tr_mod_notas
AFTER DELETE ON notas
	FOR EACH ROW
		INSERT INTO mod_log
		VALUES (NULL, user(), current_date(),current_time());
DELIMITER ;

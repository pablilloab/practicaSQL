#Intento borrar el comentario de ID 2 por estar duplicado.

START TRANSACTION;
DELETE FROM comentario WHERE ID_COMENTARIO = 2;
#COMMIT;
SELECT * FROM comentario;
#ROLLBACK;

#Ingreso de los 8 registros
START TRANSACTION;
INSERT INTO comentario (id_comentario, texto,id_oyente) values (null, "comentario 1", 6);
INSERT INTO comentario (id_comentario, texto,id_oyente) values (null, "comentario 2", 1);
INSERT INTO comentario (id_comentario, texto,id_oyente) values (null, "comentario 3", 1);
INSERT INTO comentario (id_comentario, texto,id_oyente) values (null, "comentario 4", 3);
SAVEPOINT cuarto_comentario;
INSERT INTO comentario (id_comentario, texto,id_oyente) values (null, "comentario 5", 6);
INSERT INTO comentario (id_comentario, texto,id_oyente) values (null, "comentario 6", 1);
INSERT INTO comentario (id_comentario, texto,id_oyente) values (null, "comentario 7", 1);
INSERT INTO comentario (id_comentario, texto,id_oyente) values (null, "comentario 8", 3);
SAVEPOINT octavo_comentario;

RELEASE SAVEPOINT cuarto_comentario;

#COMMIT;
#ROLLBACK;
#VISTA 1
CREATE OR REPLACE VIEW conductores_apellido AS
SELECT * FROM conductores ORDER BY nombre DESC;

#VISTA 2
CREATE OR REPLACE VIEW notas_deportes AS
SELECT titulo, contenido FROM notas
WHERE id_categoria = 3 OR id_categoria = 4;

#VISTA 3
CREATE OR REPLACE VIEW notas_mas_comentarios AS
SELECT  count(id_comentario),titulo FROM notas
GROUP BY id_comentario 
HAVING count(id_comentario)>1;

#VISTA 4
CREATE OR REPLACE VIEW oyentes_que_comentaron AS
SELECT DISTINCT nombre, apellido FROM oyentes
INNER JOIN comentario
ON oyentes.id_oyente = comentario.id_oyente ;

#VISTA 5
CREATE OR REPLACE VIEW oyentes_antes_2000 AS
SELECT nombre, apellido FROM oyentes 
WHERE fecha_registro <= '2020-01-01';
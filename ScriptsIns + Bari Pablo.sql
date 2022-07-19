INSERT INTO radio_blog.categorias (ID_CATEGORIA, NOMBRE, DESCRIPCION)
VALUES
(null, 'Politica Local', 'Notas de politica local'),
(null, 'Deportes Local', 'Notas de deportes local'),
(null, 'Deportes Internacional', 'Notas de deportes internacional'),
(null, 'Cocina', 'Recetas y tips culinarias'),
(null, 'Tecnologia', 'Notas de novedades tecnologicas'),
(null, 'Opinion', 'Notas de opinion sobre distintos temas'),
(null, 'Gamer', 'Info sobre el mundo de los videojuegos'),
(null, 'Programación', 'Notas de programación informática'),
(null, 'Naturaleza', 'Notas de cuidado del medio ambiente'),
(null, 'Policiales', 'Notas de sucesos policiales');


INSERT INTO radio_blog.oyentes (ID_OYENTE, NOMBRE, APELLIDO, FECHA_REGISTRO, USUARIO, PASSWORD)
VALUES
(null, 'Jon', 'Doe', '2022-02-01', 'jdoe', '123456'),
(null, 'Pimpi', 'Limpausa', '2019-05-25', 'pimpicienta', 'mariposa656'),
(null, 'Esteban', 'Quito', '2020-11-02', 'quitoquito', 'ayeryhoy'),
(null, 'Bruno', 'Diaz', '2022-07-04', 'soybatman', 'alfredgato'),
(null, 'Caro', 'Pardiaco', '2017-12-25', 'lacarorock', 'caro2020');


INSERT INTO radio_blog.comentario (ID_COMENTARIO, TEXTO, ID_OYENTE)
VALUES
(null, 'Que hermoso deporte que es el futbol', 1),
(null, 'No entiendo nada, mejor no opino, igual que lindo que es el sol', 6),
(null, 'EL conductor no esta capacitado para llevar a cabo este tipo de informes!!!', 4),
(null, 'Que rico se ve ese almuerzo! Como pa chuparse los dedos!!!', 3),
(null, 'Aguante All boys! ', 6);

INSERT INTO radio_blog.conductores (ID_CONDUCTORES, NOMBRE, APELLIDO, DIRECCION)
VALUES
(null, 'Jacinto', 'Chiclana', 'Avenida Siempre Viva 14'),
(null, 'Rodrigo', 'Sarratea', '9 de Julio 1040'),
(null, 'Eduardo', 'De Los Palotes', 'Mitre 630'),
(null, 'Steve', 'Harrington', 'Hawkins');

INSERT INTO radio_blog.notas (ID_NOTA, TITULO, CONTENIDO, ID_CATEGORIA, ID_COMENTARIO)
VALUES
(null, 'Asado con cuero','Ecender el fuego, salar la carne, colgar del asador hasta cocinar', 5,5),
(null, 'River 0 - Boca 3','Impresionante partido disputado en el monumental, Boca lo paso por arriba!!', 1,1),
(null, 'Dolar al infinito','El gobierno no puede sostener el dolar y se dispara como Buzz Lightyear', 3,3);

INSERT INTO radio_blog.programa (ID_PROGRAMA, NOMBRE, HORARIO, ID_CONDUCTORES, ID_NOTA)
VALUES
(null, 'La Inclemencia', '17 a 21', 1, 1),
(null, 'Deportin', '09 a 12', 1, 2),
(null, 'La luz del alba', 'Sabados', 4, 3);
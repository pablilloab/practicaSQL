#Creacion del usuario para solamente leer las tablas (solo lectura)
CREATE USER 'usuario_consulta' IDENTIFIED BY 'usuario_consulta';

#Sentencia para otorgar los permisos de solo lectura (SELCT) al usuario de consultas.
GRANT SELECT ON radio_blog.* TO 'usuario_consulta';

#Creacion del usuario para lectura/insercion/modificacion.alter
CREATE USER 'usuario_editor' IDENTIFIED BY 'usuario_editor';

#Sentencia para dar los permisos de lectura(SELECT), insercion(INSERT), modificacion (UPDATE) al usuario editor.
GRANT SELECT, INSERT, UPDATE ON radio_blog.* TO 'usuario_editor';

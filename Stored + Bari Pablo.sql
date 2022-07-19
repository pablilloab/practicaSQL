DELIMITER //
CREATE PROCEDURE `ordenar_comentario` (IN columna VARCHAR(45), IN tipoOrden INT)
BEGIN
	IF tipoOrden = 1 THEN
		SELECT * FROM comentario ORDER BY columna DESC;
    ELSE
		SELECT * FROM comentario ORDER BY columna ASC;
	END IF;
END //


DELIMITER //
CREATE PROCEDURE `agregar_categoria` (IN nombreCategoria VARCHAR(45), IN descripcionCategoria VARCHAR(45))
BEGIN
	SET @hayError = 0;
	IF nombreCategoria = "" THEN
		SELECT "ERROR: nombre de categoría vacío";
        SET @hayError = 1;
	END IF;
    IF descripcionCategoria = "" THEN
		SELECT "ERROR: descripcion de categoría vacía";
        SET @hayError = 1;
	END IF;
    IF @hayError = 0 THEN
		INSERT INTO categorias (ID_CATEGORIA, NOMBRE, DESCRIPCION) VALUES (NULL, nombreCategoria, descripcionCategoria);
	ELSE
		SELECT "No se realizó la inserción";
	END IF;
END//
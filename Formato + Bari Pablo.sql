USE radio_blog;

DELIMITER $$
CREATE FUNCTION `get_nombre_categoria` (categoria INT)
RETURNS varchar(45)
READS SQL DATA
BEGIN
	DECLARE nombreCategoria VARCHAR(45);    
    SET nombreCategoria = (SELECT nombre FROM categorias WHERE categoria = ID_CATEGORIA);    
    RETURN (nombreCategoria);
END;
$$

DELIMITER $$
CREATE FUNCTION `get_nombre_conductores` (idPrograma INT)
RETURNS varchar(45)
READS SQL DATA
BEGIN
	DECLARE nombreConductor VARCHAR(45);
    SET nombreConductor = (SELECT nombre FROM conductores INNER JOIN programa ON idPrograma = ID_PROGRAMA);
    RETURN (nombreConductor);
END;
$$


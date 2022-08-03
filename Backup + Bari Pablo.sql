/*
	BACKUP DE LAS TABLAS DE LA BASE DE DATOS
    
    TABLA PROGRAMA
    Tabla para guardar la información de los programas de radio y/o televisión que son puesto al 
	aire y establecer la relación con las notas de información que emiten junto al autor de dicha 
	nota
    
    TABLA NOTA
    Tabla para guardar las notas de información que cada programa emite, son notas que contiene 
	un tema especifico (titulo y contenido) y una categoría que la define. Expresa la relación con 
	los comentarios que dicha nota puede recibir de los oyentes o televidentes.
    
    TABLA COMENTARIO
    Tabla para guardar los comentarios que las notas reciben y su relación con el autor
    
    TABLA OYENTE
    Tabla para guardar la información de los usuarios y las credenciales de acceso a la plataforma 
	de comentarios
    
    TABLA CATEGORIAS
    Tabla para almacenar las categorías por su nombre y descripción.
    
    TABLA CONDUCTORES
    Tabla para guardar los datos de los distintos conductores de los programas

    
*/

-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: radio_blog
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `ID_CATEGORIA` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA`),
  UNIQUE KEY `ID_CATEGORIA_UNIQUE` (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para la descripcion de categorias de las notas.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `ID_COMENTARIO` int NOT NULL AUTO_INCREMENT,
  `TEXTO` varchar(256) NOT NULL,
  `ID_OYENTE` int NOT NULL,
  PRIMARY KEY (`ID_COMENTARIO`),
  KEY `ID_OYENTE_idx` (`ID_OYENTE`),
  CONSTRAINT `ID_OYENTE` FOREIGN KEY (`ID_OYENTE`) REFERENCES `oyentes` (`ID_OYENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para guardar los comentarios de los oyentes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conductores`
--

DROP TABLE IF EXISTS `conductores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conductores` (
  `ID_CONDUCTORES` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) NOT NULL,
  `APELLIDO` varchar(45) NOT NULL,
  `DIRECCION` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_CONDUCTORES`),
  UNIQUE KEY `ID_CONDUCTORES_UNIQUE` (`ID_CONDUCTORES`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para almacenar los diferentes conductores de los programas de radio.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `conductores_apellido`
--

DROP TABLE IF EXISTS `conductores_apellido`;
/*!50001 DROP VIEW IF EXISTS `conductores_apellido`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `conductores_apellido` AS SELECT 
 1 AS `ID_CONDUCTORES`,
 1 AS `NOMBRE`,
 1 AS `APELLIDO`,
 1 AS `DIRECCION`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mod_log`
--

DROP TABLE IF EXISTS `mod_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_log` (
  `id_mod` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) DEFAULT NULL,
  `dia` datetime DEFAULT NULL,
  `hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `ID_NOTA` int NOT NULL AUTO_INCREMENT,
  `TITULO` varchar(45) NOT NULL,
  `CONTENIDO` varchar(200) NOT NULL,
  `ID_CATEGORIA` int NOT NULL,
  `ID_COMENTARIO` int NOT NULL,
  PRIMARY KEY (`ID_NOTA`),
  UNIQUE KEY `ID_NOTA_UNIQUE` (`ID_NOTA`),
  KEY `ID_CATEGORIA_idx` (`ID_CATEGORIA`),
  KEY `ID_COMENTARIO_idx` (`ID_COMENTARIO`),
  CONSTRAINT `ID_CATEGORIA` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categorias` (`ID_CATEGORIA`),
  CONSTRAINT `ID_COMENTARIO` FOREIGN KEY (`ID_COMENTARIO`) REFERENCES `comentario` (`ID_COMENTARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para guardar las diferentes notas de los programas.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `notas_deportes`
--

DROP TABLE IF EXISTS `notas_deportes`;
/*!50001 DROP VIEW IF EXISTS `notas_deportes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `notas_deportes` AS SELECT 
 1 AS `titulo`,
 1 AS `contenido`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `notas_log`
--

DROP TABLE IF EXISTS `notas_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_log` (
  `id_notas_log` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `contenido` varchar(200) DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_comentario` int DEFAULT NULL,
  PRIMARY KEY (`id_notas_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `notas_mas_comentarios`
--

DROP TABLE IF EXISTS `notas_mas_comentarios`;
/*!50001 DROP VIEW IF EXISTS `notas_mas_comentarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `notas_mas_comentarios` AS SELECT 
 1 AS `count(id_comentario)`,
 1 AS `titulo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oyentes`
--

DROP TABLE IF EXISTS `oyentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oyentes` (
  `ID_OYENTE` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) NOT NULL,
  `APELLIDO` varchar(45) NOT NULL,
  `FECHA_REGISTRO` datetime NOT NULL,
  `USUARIO` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_OYENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para registro de los diferentes oyentes/televidentes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `oyentes_antes_2000`
--

DROP TABLE IF EXISTS `oyentes_antes_2000`;
/*!50001 DROP VIEW IF EXISTS `oyentes_antes_2000`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `oyentes_antes_2000` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oyentes_log`
--

DROP TABLE IF EXISTS `oyentes_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oyentes_log` (
  `id_oyentes_log` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_oyentes_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `oyentes_que_comentaron`
--

DROP TABLE IF EXISTS `oyentes_que_comentaron`;
/*!50001 DROP VIEW IF EXISTS `oyentes_que_comentaron`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `oyentes_que_comentaron` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `programa`
--

DROP TABLE IF EXISTS `programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programa` (
  `ID_PROGRAMA` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  `HORARIO` varchar(30) NOT NULL,
  `ID_CONDUCTORES` int NOT NULL,
  `ID_NOTA` int NOT NULL,
  PRIMARY KEY (`ID_PROGRAMA`),
  UNIQUE KEY `ID_PROGRAMA_UNIQUE` (`ID_PROGRAMA`),
  KEY `ID_CONDUCTORES_idx` (`ID_CONDUCTORES`),
  KEY `ID_NOTA_idx` (`ID_NOTA`),
  CONSTRAINT `ID_CONDUCTORES` FOREIGN KEY (`ID_CONDUCTORES`) REFERENCES `conductores` (`ID_CONDUCTORES`),
  CONSTRAINT `ID_NOTA` FOREIGN KEY (`ID_NOTA`) REFERENCES `notas` (`ID_NOTA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para el almacenamiento de los diferentes tipos de programas.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `conductores_apellido`
--

/*!50001 DROP VIEW IF EXISTS `conductores_apellido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `conductores_apellido` AS select `conductores`.`ID_CONDUCTORES` AS `ID_CONDUCTORES`,`conductores`.`NOMBRE` AS `NOMBRE`,`conductores`.`APELLIDO` AS `APELLIDO`,`conductores`.`DIRECCION` AS `DIRECCION` from `conductores` order by `conductores`.`NOMBRE` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `notas_deportes`
--

/*!50001 DROP VIEW IF EXISTS `notas_deportes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `notas_deportes` AS select `notas`.`TITULO` AS `titulo`,`notas`.`CONTENIDO` AS `contenido` from `notas` where ((`notas`.`ID_CATEGORIA` = 3) or (`notas`.`ID_CATEGORIA` = 4)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `notas_mas_comentarios`
--

/*!50001 DROP VIEW IF EXISTS `notas_mas_comentarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `notas_mas_comentarios` AS select count(`notas`.`ID_COMENTARIO`) AS `count(id_comentario)`,`notas`.`TITULO` AS `titulo` from `notas` group by `notas`.`ID_COMENTARIO` having (count(`notas`.`ID_COMENTARIO`) > 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oyentes_antes_2000`
--

/*!50001 DROP VIEW IF EXISTS `oyentes_antes_2000`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `oyentes_antes_2000` AS select `oyentes`.`NOMBRE` AS `nombre`,`oyentes`.`APELLIDO` AS `apellido` from `oyentes` where (`oyentes`.`FECHA_REGISTRO` <= '2020-01-01') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `oyentes_que_comentaron`
--

/*!50001 DROP VIEW IF EXISTS `oyentes_que_comentaron`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `oyentes_que_comentaron` AS select distinct `oyentes`.`NOMBRE` AS `nombre`,`oyentes`.`APELLIDO` AS `apellido` from (`oyentes` join `comentario` on((`oyentes`.`ID_OYENTE` = `comentario`.`ID_OYENTE`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-03 19:56:48


/*
	BACKUP DATOS 
*/

-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: radio_blog
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Politica','Notas de politica local'),(2,'Politica Local','Notas de politica local'),(3,'Deportes Local','Notas de deportes local'),(4,'Deportes Internacional','Notas de deportes internacional'),(5,'Cocina','Recetas y tips culinarias'),(6,'Tecnologia','Notas de novedades tecnologicas'),(7,'Opinion','Notas de opinion sobre distintos temas'),(8,'Gamer','Info sobre el mundo de los videojuegos'),(9,'Programación','Notas de programación informática'),(10,'Naturaleza','Notas de cuidado del medio ambiente'),(11,'Policiales','Notas de sucesos policiales');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,'Que hermoso deporte que es el futbol',1),(2,'Que hermoso deporte que es el futbol',1),(3,'No entiendo nada, mejor no opino, igual que lindo que es el sol',6),(4,'EL conductor no esta capacitado para llevar a cabo este tipo de informes!!!',4),(5,'Que rico se ve ese almuerzo! Como pa chuparse los dedos!!!',3),(6,'Aguante All boys! ',6);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `conductores`
--

LOCK TABLES `conductores` WRITE;
/*!40000 ALTER TABLE `conductores` DISABLE KEYS */;
INSERT INTO `conductores` VALUES (1,'Jacinto','Chiclana','Avenida Siempre Viva 14'),(2,'Rodrigo','Sarratea','9 de Julio 1040'),(3,'Eduardo','De Los Palotes','Mitre 630'),(4,'Steve','Harrington','Hawkins');
/*!40000 ALTER TABLE `conductores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mod_log`
--

LOCK TABLES `mod_log` WRITE;
/*!40000 ALTER TABLE `mod_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,'Asado con cuero','Ecender el fuego, salar la carne, colgar del asador hasta cocinar',5,5),(2,'Asado con cuero','Ecender el fuego, salar la carne, colgar del asador hasta cocinar',5,5),(3,'River 0 - Boca 3','Impresionante partido disputado en el monumental, Boca lo paso por arriba!!',1,1),(4,'Dolar al infinito','El gobierno no puede sostener el dolar y se dispara como Buzz Lightyear',3,3);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notas_log`
--

LOCK TABLES `notas_log` WRITE;
/*!40000 ALTER TABLE `notas_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oyentes`
--

LOCK TABLES `oyentes` WRITE;
/*!40000 ALTER TABLE `oyentes` DISABLE KEYS */;
INSERT INTO `oyentes` VALUES (1,'Jon','Doe','2022-02-01 00:00:00','jdoe','123456'),(2,'Jon','Doe','2022-02-01 00:00:00','jdoe','123456'),(3,'Pimpi','Limpausa','2019-05-25 00:00:00','pimpicienta','mariposa656'),(4,'Esteban','Quito','2020-11-02 00:00:00','quitoquito','ayeryhoy'),(5,'Bruno','Diaz','2022-07-04 00:00:00','soybatman','alfredgato'),(6,'Caro','Pardiaco','2017-12-25 00:00:00','lacarorock','caro2020');
/*!40000 ALTER TABLE `oyentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oyentes_log`
--

LOCK TABLES `oyentes_log` WRITE;
/*!40000 ALTER TABLE `oyentes_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `oyentes_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `programa`
--

LOCK TABLES `programa` WRITE;
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` VALUES (1,'La Inclemencia','17 a 21',1,1),(2,'La Inclemencia','17 a 21',1,1),(3,'Deportin','09 a 12',1,2),(4,'La luz del alba','Sabados',4,3);
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-03 19:57:09


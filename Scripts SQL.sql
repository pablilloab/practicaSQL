-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema radio_blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema radio_blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `radio_blog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `radio_blog` ;

-- -----------------------------------------------------
-- Table `radio_blog`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `radio_blog`.`categorias` (
  `ID_CATEGORIA` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA`),
  UNIQUE INDEX `ID_CATEGORIA_UNIQUE` (`ID_CATEGORIA` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Tabla para la descripcion de categorias de las notas.';


-- -----------------------------------------------------
-- Table `radio_blog`.`oyentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `radio_blog`.`oyentes` (
  `ID_OYENTE` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDO` VARCHAR(45) NOT NULL,
  `FECHA_REGISTRO` DATETIME NOT NULL,
  `USUARIO` VARCHAR(45) NOT NULL,
  `PASSWORD` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_OYENTE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Tabla para registro de los diferentes oyentes/televidentes';


-- -----------------------------------------------------
-- Table `radio_blog`.`comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `radio_blog`.`comentario` (
  `ID_COMENTARIO` INT NOT NULL AUTO_INCREMENT,
  `TEXTO` VARCHAR(256) NOT NULL,
  `ID_OYENTE` INT NOT NULL,
  PRIMARY KEY (`ID_COMENTARIO`),
  INDEX `ID_OYENTE_idx` (`ID_OYENTE` ASC) VISIBLE,
  CONSTRAINT `ID_OYENTE`
    FOREIGN KEY (`ID_OYENTE`)
    REFERENCES `radio_blog`.`oyentes` (`ID_OYENTE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Tabla para guardar los comentarios de los oyentes.';


-- -----------------------------------------------------
-- Table `radio_blog`.`conductores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `radio_blog`.`conductores` (
  `ID_CONDUCTORES` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDO` VARCHAR(45) NOT NULL,
  `DIRECCION` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_CONDUCTORES`),
  UNIQUE INDEX `ID_CONDUCTORES_UNIQUE` (`ID_CONDUCTORES` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Tabla para almacenar los diferentes conductores de los programas de radio.';


-- -----------------------------------------------------
-- Table `radio_blog`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `radio_blog`.`notas` (
  `ID_NOTA` INT NOT NULL AUTO_INCREMENT,
  `TITULO` VARCHAR(45) NOT NULL,
  `CONTENIDO` VARCHAR(45) NOT NULL,
  `ID_CATEGORIA` INT NOT NULL,
  `ID_COMENTARIO` INT NOT NULL,
  PRIMARY KEY (`ID_NOTA`),
  UNIQUE INDEX `ID_NOTA_UNIQUE` (`ID_NOTA` ASC) VISIBLE,
  INDEX `ID_CATEGORIA_idx` (`ID_CATEGORIA` ASC) VISIBLE,
  INDEX `ID_COMENTARIO_idx` (`ID_COMENTARIO` ASC) VISIBLE,
  CONSTRAINT `ID_CATEGORIA`
    FOREIGN KEY (`ID_CATEGORIA`)
    REFERENCES `radio_blog`.`categorias` (`ID_CATEGORIA`),
  CONSTRAINT `ID_COMENTARIO`
    FOREIGN KEY (`ID_COMENTARIO`)
    REFERENCES `radio_blog`.`comentario` (`ID_COMENTARIO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Tabla para guardar las diferentes notas de los programas.';


-- -----------------------------------------------------
-- Table `radio_blog`.`programa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `radio_blog`.`programa` (
  `ID_PROGRAMA` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(100) NOT NULL,
  `HORARIO` DATETIME NOT NULL,
  `ID_CONDUCTORES` INT NOT NULL,
  `ID_NOTA` INT NOT NULL,
  PRIMARY KEY (`ID_PROGRAMA`),
  UNIQUE INDEX `ID_PROGRAMA_UNIQUE` (`ID_PROGRAMA` ASC) VISIBLE,
  INDEX `ID_CONDUCTORES_idx` (`ID_CONDUCTORES` ASC) VISIBLE,
  INDEX `ID_NOTA_idx` (`ID_NOTA` ASC) VISIBLE,
  CONSTRAINT `ID_CONDUCTORES`
    FOREIGN KEY (`ID_CONDUCTORES`)
    REFERENCES `radio_blog`.`conductores` (`ID_CONDUCTORES`),
  CONSTRAINT `ID_NOTA`
    FOREIGN KEY (`ID_NOTA`)
    REFERENCES `radio_blog`.`notas` (`ID_NOTA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = 'Tabla para el almacenamiento de los diferentes tipos de programas.';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

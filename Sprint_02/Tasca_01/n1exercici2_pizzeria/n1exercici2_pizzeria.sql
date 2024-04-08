-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `n1exercici2_pizzeria` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `n1exercici2_pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `n1exercici2_pizzeria` ;

-- -----------------------------------------------------
-- Table `n1exercici2_pizzeria`.`PROVINCIA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2_pizzeria`.`PROVINCIA` ;

CREATE TABLE IF NOT EXISTS `n1exercici2_pizzeria`.`PROVINCIA` (
  `id_provincia` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_provincia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2_pizzeria`.`LOCALITAT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2_pizzeria`.`LOCALITAT` ;

CREATE TABLE IF NOT EXISTS `n1exercici2_pizzeria`.`LOCALITAT` (
  `id_localitat` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `id_provincia` INT NOT NULL,
  PRIMARY KEY (`id_localitat`, `id_provincia`),
  INDEX `fk_LOCALITAT_PROVINCIA1_idx` (`id_provincia` ASC) ,
  CONSTRAINT `fk_LOCALITAT_PROVINCIA1`
    FOREIGN KEY (`id_provincia`)
    REFERENCES `n1exercici2_pizzeria`.`PROVINCIA` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2_pizzeria`.`ADREÇA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2_pizzeria`.`ADREÇA` ;

CREATE TABLE IF NOT EXISTS `n1exercici2_pizzeria`.`ADREÇA` (
  `id_adreça` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `pis` INT NOT NULL,
  `porta` INT NOT NULL,
  `codi_postal` INT NOT NULL,
  `id_localitat` INT NOT NULL,
  `id_provincia` INT NOT NULL,
  PRIMARY KEY (`id_adreça`, `id_localitat`, `id_provincia`),
  INDEX `fk_ADREÇA_LOCALITAT1_idx` (`id_localitat` ASC, `id_provincia` ASC) ,
  CONSTRAINT `fk_ADREÇA_LOCALITAT1`
    FOREIGN KEY (`id_localitat` , `id_provincia`)
    REFERENCES `n1exercici2_pizzeria`.`LOCALITAT` (`id_localitat` , `id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2_pizzeria`.`CLIENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2_pizzeria`.`CLIENT` ;

CREATE TABLE IF NOT EXISTS `n1exercici2_pizzeria`.`CLIENT` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cogoms` VARCHAR(45) NOT NULL,
  `telefon` INT NOT NULL,
  `id_adreça` INT NOT NULL,
  `id_localitat` INT NOT NULL,
  `id_provincia` INT NOT NULL,
  PRIMARY KEY (`id_client`, `id_adreça`, `id_localitat`, `id_provincia`),
  INDEX `fk_CLIENT_ADREÇA1_idx` (`id_adreça` ASC, `id_localitat` ASC, `id_provincia` ASC) ,
  CONSTRAINT `fk_CLIENT_ADREÇA1`
    FOREIGN KEY (`id_adreça` , `id_localitat` , `id_provincia`)
    REFERENCES `n1exercici2_pizzeria`.`ADREÇA` (`id_adreça` , `id_localitat` , `id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2_pizzeria`.`BOTIGA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2_pizzeria`.`BOTIGA` ;

CREATE TABLE IF NOT EXISTS `n1exercici2_pizzeria`.`BOTIGA` (
  `id_botiga` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `id_adreça` INT NOT NULL,
  `id_localitat` INT NOT NULL,
  `id_provincia` INT NOT NULL,
  PRIMARY KEY (`id_botiga`, `id_adreça`, `id_localitat`, `id_provincia`),
  INDEX `fk_BOTIGA_ADREÇA1_idx` (`id_adreça` ASC, `id_localitat` ASC, `id_provincia` ASC) ,
  CONSTRAINT `fk_BOTIGA_ADREÇA1`
    FOREIGN KEY (`id_adreça` , `id_localitat` , `id_provincia`)
    REFERENCES `n1exercici2_pizzeria`.`ADREÇA` (`id_adreça` , `id_localitat` , `id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2_pizzeria`.`COMANDA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2_pizzeria`.`COMANDA` ;

CREATE TABLE IF NOT EXISTS `n1exercici2_pizzeria`.`COMANDA` (
  `id_comanda` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `tipus` ENUM('domicili', 'botiga') NOT NULL,
  `quantitat_pizza` INT NOT NULL,
  `quantitat_hamburguesa` INT NOT NULL,
  `quantitat_beguda` INT NOT NULL,
  `preu_total` DOUBLE NOT NULL,
  `id_botiga` INT NOT NULL,
  `id_adreça` INT NOT NULL,
  `id_localitat` INT NOT NULL,
  `id_provincia` INT NOT NULL,
  PRIMARY KEY (`id_comanda`),
  INDEX `fk_COMANDA_BOTIGA1_idx` (`id_botiga` ASC, `id_adreça` ASC, `id_localitat` ASC, `id_provincia` ASC) ,
  CONSTRAINT `fk_COMANDA_BOTIGA1`
    FOREIGN KEY (`id_botiga` , `id_adreça` , `id_localitat` , `id_provincia`)
    REFERENCES `n1exercici2_pizzeria`.`BOTIGA` (`id_botiga` , `id_adreça` , `id_localitat` , `id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2_pizzeria`.`HAMBURGUESA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2_pizzeria`.`HAMBURGUESA` ;

CREATE TABLE IF NOT EXISTS `n1exercici2_pizzeria`.`HAMBURGUESA` (
  `id_hamburguesa` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `descripcio` VARCHAR(45) NOT NULL,
  `imatge` BLOB NULL,
  `preu` DOUBLE NOT NULL,
  PRIMARY KEY (`id_hamburguesa`),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2_pizzeria`.`BEGUDA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2_pizzeria`.`BEGUDA` ;

CREATE TABLE IF NOT EXISTS `n1exercici2_pizzeria`.`BEGUDA` (
  `id_hamburguesa` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `descripcio` VARCHAR(45) NOT NULL,
  `imatge` BLOB NULL,
  `preu` DOUBLE NOT NULL,
  PRIMARY KEY (`id_hamburguesa`),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2_pizzeria`.`CATEGORIA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2_pizzeria`.`CATEGORIA` ;

CREATE TABLE IF NOT EXISTS `n1exercici2_pizzeria`.`CATEGORIA` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2_pizzeria`.`PIZZA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2_pizzeria`.`PIZZA` ;

CREATE TABLE IF NOT EXISTS `n1exercici2_pizzeria`.`PIZZA` (
  `id_pizza` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `descripcio` VARCHAR(45) NOT NULL,
  `imatge` BLOB NULL,
  `preu` DOUBLE NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_pizza`, `id_categoria`),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC) ,
  INDEX `fk_PIZZA_CATEGORIA_idx` (`id_categoria` ASC) ,
  CONSTRAINT `fk_PIZZA_CATEGORIA`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `n1exercici2_pizzeria`.`CATEGORIA` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2_pizzeria`.`LINEA_COMANDA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2_pizzeria`.`LINEA_COMANDA` ;

CREATE TABLE IF NOT EXISTS `n1exercici2_pizzeria`.`LINEA_COMANDA` (
  `id_detalls` INT NOT NULL AUTO_INCREMENT,
  `id_comanda` INT NOT NULL,
  `id_hamburguesa` INT NOT NULL,
  `id_beguda` INT NOT NULL,
  `id_pizza` INT NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_detalls`, `id_comanda`),
  INDEX `fk_LINEA_COMANDA_COMANDA1_idx` (`id_comanda` ASC) ,
  INDEX `fk_LINEA_COMANDA_HAMBURGUESA1_idx` (`id_hamburguesa` ASC) ,
  INDEX `fk_LINEA_COMANDA_BEGUDA1_idx` (`id_beguda` ASC) ,
  INDEX `fk_LINEA_COMANDA_PIZZA1_idx` (`id_pizza` ASC, `id_categoria` ASC) ,
  CONSTRAINT `fk_LINEA_COMANDA_COMANDA1`
    FOREIGN KEY (`id_comanda`)
    REFERENCES `n1exercici2_pizzeria`.`COMANDA` (`id_comanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LINEA_COMANDA_HAMBURGUESA1`
    FOREIGN KEY (`id_hamburguesa`)
    REFERENCES `n1exercici2_pizzeria`.`HAMBURGUESA` (`id_hamburguesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LINEA_COMANDA_BEGUDA1`
    FOREIGN KEY (`id_beguda`)
    REFERENCES `n1exercici2_pizzeria`.`BEGUDA` (`id_hamburguesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LINEA_COMANDA_PIZZA1`
    FOREIGN KEY (`id_pizza` , `id_categoria`)
    REFERENCES `n1exercici2_pizzeria`.`PIZZA` (`id_pizza` , `id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2_pizzeria`.`EMPLEAT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2_pizzeria`.`EMPLEAT` ;

CREATE TABLE IF NOT EXISTS `n1exercici2_pizzeria`.`EMPLEAT` (
  `id_empleat` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(45) NOT NULL,
  `telefon` INT NOT NULL,
  `posicio` ENUM('cuiner', 'repartidor') NOT NULL,
  `id_botiga` INT NOT NULL,
  `id_adreça` INT NOT NULL,
  `id_localitat` INT NOT NULL,
  `id_provincia` INT NOT NULL,
  PRIMARY KEY (`id_empleat`, `id_botiga`, `id_adreça`, `id_localitat`, `id_provincia`),
  INDEX `fk_EMPLEAT_BOTIGA1_idx` (`id_botiga` ASC, `id_adreça` ASC, `id_localitat` ASC, `id_provincia` ASC) ,
  CONSTRAINT `fk_EMPLEAT_BOTIGA1`
    FOREIGN KEY (`id_botiga` , `id_adreça` , `id_localitat` , `id_provincia`)
    REFERENCES `n1exercici2_pizzeria`.`BOTIGA` (`id_botiga` , `id_adreça` , `id_localitat` , `id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `n1exercici2_pizzeria`.`REPARTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `n1exercici2_pizzeria`.`REPARTO` ;

CREATE TABLE IF NOT EXISTS `n1exercici2_pizzeria`.`REPARTO` (
  `id_reparto` INT NOT NULL,
  `lliurament` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `id_comanda` INT NOT NULL,
  `id_empleat` INT NOT NULL,
  PRIMARY KEY (`id_reparto`, `id_comanda`, `id_empleat`),
  INDEX `fk_REPARTO_COMANDA1_idx` (`id_comanda` ASC) ,
  INDEX `fk_REPARTO_EMPLEAT1_idx` (`id_empleat` ASC) ,
  CONSTRAINT `fk_REPARTO_COMANDA1`
    FOREIGN KEY (`id_comanda`)
    REFERENCES `n1exercici2_pizzeria`.`COMANDA` (`id_comanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REPARTO_EMPLEAT1`
    FOREIGN KEY (`id_empleat`)
    REFERENCES `n1exercici2_pizzeria`.`EMPLEAT` (`id_empleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Data for table `n1exercici2_pizzeria`.`PROVINCIA`
-- -----------------------------------------------------
START TRANSACTION;
USE `n1exercici2_pizzeria`;
INSERT INTO `n1exercici2_pizzeria`.`PROVINCIA` (`id_provincia`, `nom`) VALUES (1, 'BARCELONA');
INSERT INTO `n1exercici2_pizzeria`.`PROVINCIA` (`id_provincia`, `nom`) VALUES (2, 'GIRONA');

COMMIT;

